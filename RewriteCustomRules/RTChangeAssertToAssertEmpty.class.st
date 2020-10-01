"
I am a Demo Rewrite Rule.
"
Class {
	#name : #RTChangeAssertToAssertEmpty,
	#superclass : #RBCustomTransformationRule,
	#category : #'RewriteCustomRules-Examples'
}

{ #category : #initialization }
RTChangeAssertToAssertEmpty >> initialize [
	
	| searchForPattern replaceWithPattern |
	super initialize.
	searchForPattern := '`@receiver assert: `@arg isEmpty'.
	replaceWithPattern := '`@receiver assertEmpty: `@arg'.
	rewriteRule replace: searchForPattern with: replaceWithPattern
]

{ #category : #testing }
RTChangeAssertToAssertEmpty >> isDemoRule [

	^ true
]