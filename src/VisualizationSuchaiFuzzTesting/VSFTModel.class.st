Class {
	#name : #VSFTModel,
	#superclass : #Object,
	#instVars : [
		'name',
		'sequences'
	],
	#category : #VisualizationSuchaiFuzzTesting
}

{ #category : #adding }
VSFTModel >> addJSONAsString: aString [
	| t s ss |
	t := NeoJSONReader fromString: aString.
	t doWithIndex: [ :tt :index |
		s := VSFTSequence new index: index.
		s exitCode: (tt at: 'exit code').
		s realMemory: (tt at: 'real memory (kb)').
		s totalTime: (tt at: 'total time (s)').
		s virtualMemory: (tt at: 'virtual memory (kb)').
		(tt at: 'cmds') doWithIndex: [ :ttt :index2 |
			ss := VSFTCommand new.
			ss index: index2.
			ss name: (ttt at: 'cmd_name').
			ss parameters: (ttt at: 'params').
			s addCommand: ss.
		].
		self addSequence: s  ]
]

{ #category : #adding }
VSFTModel >> addSequence: aSequence [
	sequences add: aSequence.
	aSequence model: self.
	aSequence commands do: [ :c | c model: self ]
]

{ #category : #accessing }
VSFTModel >> exitCodes [

	^ (self sequences collect: #exitCode) asSet
]

{ #category : #visualization }
VSFTModel >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'Mem. x Time';
		initializeCanvas: [ self visualize ]
]

{ #category : #initialization }
VSFTModel >> initialize [
	super initialize.
	self name: 'UNNAMED'.
	sequences := OrderedCollection new
]

{ #category : #accessing }
VSFTModel >> name [
	^ name
]

{ #category : #accessing }
VSFTModel >> name: aString [
	name := aString
]

{ #category : #accessing }
VSFTModel >> numberOfExitCodes [

	^ self exitCodes size
]

{ #category : #accessing }
VSFTModel >> numberOfSequences [
	^ sequences size
]

{ #category : #accessing }
VSFTModel >> sequences [
	"Return the sequences contained in the models"
	^ sequences
]

{ #category : #visualization }
VSFTModel >> visualize [
	| m scale legend |
	scale := NSScale ordinalColored: self numberOfExitCodes.
	m := RSMondrian new.
	m shape color: [ :s | scale scale: s exitCode ].
	m nodes: (self sequences sortedAs: #exitCode).
	m normalizeWidth: #totalTime.
	m normalizeHeight: #realMemory.
	m build.
	
	legend := RSLegend new.
	legend container: m canvas.
	legend title: 'Legend'.
	legend text: 'Each box is a sequence'.
	legend text: 'Width = total execution time'.
	legend text: 'Height = real memory'.
	self exitCodes do: [ :ec |
		legend text: 'Exit code = ', ec asString withBoxColor: (scale scale: ec).
	].
	legend legendDo: [ :l | 
		l color: Color white.
		l 
			withBorder;
			padding: 20 ].
	legend onDemand: 'Legend'.
	legend build.
	^ m canvas
]
