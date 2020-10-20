Class {
	#name : #VSFTItem,
	#superclass : #Object,
	#instVars : [
		'index',
		'model'
	],
	#category : #VisualizationSuchaiFuzzTesting
}

{ #category : #accessing }
VSFTItem >> index [
	^ index
]

{ #category : #accessing }
VSFTItem >> index: aNumber [
	index := aNumber
]

{ #category : #initialization }
VSFTItem >> initialize [
	super initialize.
	"Not set yet"
	index := -1.
]

{ #category : #accessing }
VSFTItem >> model [
	^ model
]

{ #category : #accessing }
VSFTItem >> model: anObject [
	model := anObject
]
