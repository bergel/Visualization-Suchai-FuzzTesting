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
		self addSequence: ss  ]
]

{ #category : #adding }
VSFTModel >> addSequence: aSequence [
	sequences add: aSequence
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
