Class {
	#name : #VSFTCommandExecution,
	#superclass : #VSFTItem,
	#instVars : [
		'name',
		'parameters',
		'command'
	],
	#category : #VisualizationSuchaiFuzzTesting
}

{ #category : #accessing }
VSFTCommandExecution >> command [
	^ command
]

{ #category : #accessing }
VSFTCommandExecution >> command: anObject [
	command := anObject
]

{ #category : #accessing }
VSFTCommandExecution >> name [
	^ name
]

{ #category : #accessing }
VSFTCommandExecution >> name: anObject [
	name := anObject
]

{ #category : #accessing }
VSFTCommandExecution >> parameters: someParameters [
	parameters := someParameters
]

{ #category : #printing }
VSFTCommandExecution >> printOn: str [
	str nextPut: $<.
	self name ifNotNil: [ str nextPutAll: self name ].
	str nextPut: $>.
]
