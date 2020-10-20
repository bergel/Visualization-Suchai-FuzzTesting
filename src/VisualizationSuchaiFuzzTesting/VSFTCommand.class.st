Class {
	#name : #VSFTCommand,
	#superclass : #VSFTItem,
	#instVars : [
		'name',
		'parameters'
	],
	#category : #VisualizationSuchaiFuzzTesting
}

{ #category : #accessing }
VSFTCommand >> name [
	^ name
]

{ #category : #accessing }
VSFTCommand >> name: anObject [
	name := anObject
]

{ #category : #accessing }
VSFTCommand >> parameters: someParameters [
	parameters := someParameters
]
