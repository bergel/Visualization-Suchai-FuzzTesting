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
VSFTSequence >> exitCode [
	^ exitCode
]

{ #category : #accessing }
VSFTSequence >> exitCode: aNumber [
	exitCode := aNumber
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
