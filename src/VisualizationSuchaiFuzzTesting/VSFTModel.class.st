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

{ #category : #'as yet unclassified' }
VSFTModel >> numberOfSequences [
	^ sequences size
]

{ #category : #accessing }
VSFTModel >> sequences [
	"Return the sequences contained in the models"
	^ sequences
]

{ #category : #'as yet unclassified' }
VSFTModel >> visualize [
	| m |
	m := RSMondrian new.
	m nodes: self sequences.
	m normalizeWidth: #totalTime.
	m normalizeHeight: #realMemory.
	m build.
	^ m canvas
]
