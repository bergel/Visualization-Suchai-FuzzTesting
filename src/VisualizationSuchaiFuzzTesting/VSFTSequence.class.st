Class {
	#name : #VSFTSequence,
	#superclass : #VSFTItem,
	#instVars : [
		'exitCode',
		'realMemory',
		'totalTime',
		'virtualMemory',
		'commands'
	],
	#category : #VisualizationSuchaiFuzzTesting
}

{ #category : #adding }
VSFTSequence >> addCommand: aCommand [
	commands add: aCommand
]

{ #category : #accessing }
VSFTSequence >> commands [
	^ commands
]

{ #category : #accessing }
VSFTSequence >> exitCode [
	^ exitCode
]

{ #category : #accessing }
VSFTSequence >> exitCode: aNumber [
	exitCode := aNumber
]

{ #category : #visualization }
VSFTSequence >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'Commands';
		initializeCanvas: [ self visualize ]
]

{ #category : #initialization }
VSFTSequence >> initialize [
	super initialize.
	commands := OrderedCollection new
]

{ #category : #accessing }
VSFTSequence >> realMemory [
	^ realMemory
]

{ #category : #accessing }
VSFTSequence >> realMemory: aNumber [
	realMemory := aNumber
]

{ #category : #accessing }
VSFTSequence >> totalTime [
	^ totalTime
]

{ #category : #accessing }
VSFTSequence >> totalTime: aNumber [
	totalTime := aNumber
]

{ #category : #accessing }
VSFTSequence >> virtualMemory [
	^ virtualMemory
]

{ #category : #accessing }
VSFTSequence >> virtualMemory: aNumber [
	virtualMemory := aNumber
]

{ #category : #visualization }
VSFTSequence >> visualize [
	| m |
	m := RSMondrian new.
	m shape label.
	m nodes: self commands.
	m layout flow.
	m build.
	^ m canvas
]
