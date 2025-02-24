Class {
	#name : #VSFTModel,
	#superclass : #Object,
	#instVars : [
		'name',
		'sequences',
		'commands'
	],
	#category : #VisualizationSuchaiFuzzTesting
}

{ #category : #adding }
VSFTModel >> addJSONAsString: aString [
	| t s ss c |
	t := NeoJSONReader fromString: aString.
	t doWithIndex: [ :tt :index |
		s := VSFTSequence new index: index.
		s exitCode: (tt at: 'exit code').
		s realMemory: (tt at: 'real memory (kb)').
		s totalTime: (tt at: 'total time (s)').
		s virtualMemory: (tt at: 'virtual memory (kb)').
		(tt at: 'cmds') doWithIndex: [ :ttt :index2 |
			ss := VSFTCommandExecution new.
			ss index: index2.
			ss name: (ttt at: 'cmd_name').
			ss parameters: (ttt at: 'params').
			s addCommandExecution: ss.
			ss sequence: s.
		].
		self addSequence: s  ].
	
	(sequences flatCollect: #commandExecutions) do: [ :ce |
		c := self commandNamed: ce name.
		c addExecution: ce.
		ce command: c ]
]

{ #category : #adding }
VSFTModel >> addSequence: aSequence [
	sequences add: aSequence.
	aSequence model: self.
	aSequence commandExecutions do: [ :c | c model: self ]
]

{ #category : #accessing }
VSFTModel >> commandNamed: aName [
	| c |
	c := commands detect: [ :cc | cc name = aName ] ifNone: [ nil ].
	c ifNotNil: [ ^ c ].
	
	c := VSFTCommand new name: aName.
	commands add: c.
	^ c
	
]

{ #category : #accessing }
VSFTModel >> commands [
	^ commands
]

{ #category : #accessing }
VSFTModel >> exitCodes [

	^ (self sequences collect: #exitCode) asSet
]

{ #category : #visualization }
VSFTModel >> gtInspectorViewCommandsIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'Commands';
		initializeCanvas: [ self visualizeCommands ]
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
	sequences := OrderedCollection new.
	commands := OrderedCollection new.
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
VSFTModel >> numberOfCommands [
	^ commands size
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

{ #category : #visualization }
VSFTModel >> visualizeCommands [
	| m scale legend |
	scale := NSScale ordinalColored: self numberOfExitCodes.

	m := RSMondrian new.
	m shape label
		color: [ :c | scale scale: c representativeSequenceExitCode ].
	m nodes: self commands.
	m layout flow.
	m build.
	
	legend := RSLegend new.
	legend container: m canvas.
	legend title: 'List of commands'.
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
