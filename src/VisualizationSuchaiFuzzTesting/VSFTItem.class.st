Class {
	#name : #VSFTItem,
	#superclass : #Object,
	#instVars : [
		'index'
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
