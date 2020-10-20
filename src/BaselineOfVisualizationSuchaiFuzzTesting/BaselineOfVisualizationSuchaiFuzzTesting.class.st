Class {
	#name : #BaselineOfVisualizationSuchaiFuzzTesting,
	#superclass : #BaselineOf,
	#category : #BaselineOfVisualizationSuchaiFuzzTesting
}

{ #category : #baselines }
BaselineOfVisualizationSuchaiFuzzTesting >> baseline: spec [
	<baseline>
	spec baseline: 'NeoJSON' with: [ spec repository: 'github://svenvc/NeoJSON/repository' ].
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'VisualizationSuchaiFuzzTesting' ].
			
	spec group: 'default' with: #('NeoJSON' 'VisualizationSuchaiFuzzTesting').
]
