Class {
	#name : #VSFTCommand,
	#superclass : #VSFTItem,
	#instVars : [
		'name',
		'executions'
	],
	#category : #VisualizationSuchaiFuzzTesting
}

{ #category : #adding }
VSFTCommand >> addExecution: anExecution [
	executions add: anExecution
]

{ #category : #initialization }
VSFTCommand >> initialize [
	super initialize.
	executions := OrderedCollection new
]

{ #category : #accessing }
VSFTCommand >> name [
	^ name
]

{ #category : #accessing }
VSFTCommand >> name: aName [
	name := aName
]
