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

{ #category : #'as yet unclassified' }
VSFTCommand >> executions [
	^ executions
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

{ #category : #'as yet unclassified' }
VSFTCommand >> numberOfExecutions [
	^ executions size
]

{ #category : #printing }
VSFTCommand >> printOn: str [
	str nextPut: $<.
	self name ifNotNil: [ str nextPutAll: self name ].
	str nextPutAll: ' C>'.
]

{ #category : #'as yet unclassified' }
VSFTCommand >> representativeSequenceExitCode [
	| d fq max |
	d := (executions collect: #sequenceExitCode) groupedBy: #yourself.
	
	fq := d associations collect: [ :as | as value size ].
	max := fq max.
	d associations do: [ :as |
		as value size = max ifTrue: [ ^ as key ] ]
	
]
