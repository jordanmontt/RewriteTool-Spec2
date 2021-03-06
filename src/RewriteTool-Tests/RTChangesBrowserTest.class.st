Class {
	#name : #RTChangesBrowserTest,
	#superclass : #TestCase,
	#instVars : [
		'browser'
	],
	#category : #'RewriteTool-Tests'
}

{ #category : #defaults }
RTChangesBrowserTest >> createDirtyClassForTesting: aClassName [

	| classWithDirtyMethod |
	classWithDirtyMethod := Object
		                        subclass: aClassName
		                        instanceVariableNames: ''
		                        classVariableNames: ''
		                        package:
		                        RTCustomRuleGenerator packageName
		                        , '-JustForTesting'.
	classWithDirtyMethod
		compile: 'aMethod
		a = b ifTrue: [ ^ self]'
		classified: 'initialization'.
	^ classWithDirtyMethod
]

{ #category : #defaults }
RTChangesBrowserTest >> getChangesArray: aClassName [

	| rule changes |
	rule := RTCustomRuleGenerator new
		        searchFor: '`@expression ifTrue: [ `@codeBlock ]';
		        replaceWith: '`@expression ifFalse: [ ^ self ].
`@codeBlock';
		        generateRule: 'ATemporaryRuleJustForTesting'
		        forPackage: 'JustForTesting'
		        isForMethod: false.
	changes := RTCustomRuleGenerator
		           obtainChanges:
		           ( (self class environment classNamed: aClassName) methods)
		           forRules: { rule new }.
	rule removeFromSystem.
	^ changes
]

{ #category : #running }
RTChangesBrowserTest >> setUp [

	super setUp.
	browser := RTChangesBrowser new
]

{ #category : #tests }
RTChangesBrowserTest >> testBuildDiffFor [

	| changes classWithDirtyMethod tempClassName |
	tempClassName := 'DirtyClassThatHasOneMethodForTestingDiff'.
	classWithDirtyMethod := self createDirtyClassForTesting:
		                        tempClassName.
	changes := self getChangesArray: tempClassName.
	self assert: (browser buildDiffFor: nil) equals: ''.
	self
		assert: (browser buildDiffFor: changes first changes first) leftText
		equals: changes first changes first oldVersionTextToDisplay.
	self
		assert:
		(browser buildDiffFor: changes first changes first) rightText
		equals: changes first changes first textToDisplay.
	classWithDirtyMethod removeFromSystem
]

{ #category : #tests }
RTChangesBrowserTest >> testChanges [

	| changes classWithDirtyMethod |
	classWithDirtyMethod := self createDirtyClassForTesting:
		                        'ADirtyClassThatHasOneMethodForTestingChanges'.
	changes := self getChangesArray:
		           'ADirtyClassThatHasOneMethodForTestingChanges'.
	browser changes: changes.
	self assert: browser changes equals: changes.
	classWithDirtyMethod removeFromSystem
]

{ #category : #tests }
RTChangesBrowserTest >> testInitialize [
self assertEmpty: browser changes
]

{ #category : #tests }
RTChangesBrowserTest >> testInitializePresenters [

	self assert: browser changesTree isNotNil.
	self assert: browser diffView isNotNil.
	self assert: browser buttonOk isNotNil.
	self assert: browser buttonCancel isNotNil.
	self assertCollection: browser focusOrder equals: { 
			browser changesTree.
			browser diffView.
			browser buttonOk.
			browser buttonCancel } asOrderedCollection
]

{ #category : #tests }
RTChangesBrowserTest >> testOpen [

	| changesBrowserWindow |
	changesBrowserWindow := browser open.
	self assert: changesBrowserWindow isBuilt.
	changesBrowserWindow close
]

{ #category : #tests }
RTChangesBrowserTest >> testSelectedChanges [

	| changes classWithDirtyMethod |
	"At first there is no selected changes."
	self assertEmpty: browser selectedChanges.
	classWithDirtyMethod := self createDirtyClassForTesting:
		                        'ADirtyClassThatHasOneMethodForTesting'.
	changes := self getChangesArray:
		           'ADirtyClassThatHasOneMethodForTesting'.
	browser changes: changes.
	"The browser has one change and that change must be in the selectedChanges."
	self assert: browser selectedChanges size equals: 1.
	classWithDirtyMethod removeFromSystem
]
