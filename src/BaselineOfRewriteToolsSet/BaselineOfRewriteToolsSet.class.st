"
The baseline of RewriteToolsSet. This is necessat for install the tool from GitHub.
"
Class {
	#name : #BaselineOfRewriteToolsSet,
	#superclass : #BaselineOf,
	#category : #BaselineOfRewriteToolsSet
}

{ #category : #baselines }
BaselineOfRewriteToolsSet >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: 'RewriteRulesCreator';
			package: 'RewriteCustomRules';
			package: 'RewriteRuleTools';
			package: 'RewriteRuleBuilder';
			package: 'RewriteTool-Tests' ]
]
