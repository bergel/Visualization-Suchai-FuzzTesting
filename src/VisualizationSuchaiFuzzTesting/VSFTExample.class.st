Class {
	#name : #VSFTExample,
	#superclass : #Object,
	#category : #VisualizationSuchaiFuzzTesting
}

{ #category : #'as yet unclassified' }
VSFTExample >> rootFolder [
	^ '/Users/alexandrebergel/Dropbox/GitRepos/Visualization-Suchai-FuzzTesting/data/'
]

{ #category : #'as yet unclassified' }
VSFTExample >> strategy1 [
	<script: 'self new strategy1 inspect'>
	| children m |
	children := (self rootFolder, 'Strategy1') asFileReference children.
	
	m := VSFTModel new.
	m addJSONAsString: children first contents.
	^ m
]
