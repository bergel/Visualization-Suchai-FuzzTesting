Class {
	#name : #BaselineOfVisualizationSuchaiFuzzTesting,
	#superclass : #BaselineOf,
	#category : #BaselineOfVisualizationSuchaiFuzzTesting
}

{ #category : #baselines }
BaselineOfVisualizationSuchaiFuzzTesting >> baseline: spec [
	<baseline>
	spec baseline: 'NeoJSON' with: [ spec repository: 'github://svenvc/NeoJSON/repository' ].
	spec baseline: 'Roassal3' with: [ 
		spec repository: 'github://ObjectProfile/Roassal3/src'; loads: #('Full') ].
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'VisualizationSuchaiFuzzTesting' ].
			
	spec group: 'default' with: #('NeoJSON' 'Roassal3' 'VisualizationSuchaiFuzzTesting').
]
