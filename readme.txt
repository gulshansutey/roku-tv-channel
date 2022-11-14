"m" is associative array, m has component scope. we define our variables by adding somehting in a object
In general - "m.top" in Brightscript is used to reference the xml component in which is used.
For more on scoping - https://developer.roku.com/en-gb/docs/developer-program/core-concepts/data-scoping.md

xml is the scene graph component
Each xml scene graph file has its coresponding brs file which defines the behaviour

 
SceneGraph XML component file must have exactly one <component> element that contains all other XML elements in the file.

----------<component>----------
<component name="GridScreen" extends="Group" initialFocus="RowList">

`name` is a required attr so it can be used in a <children> element as <GridScreen/> or
using BrightScript in a <script> element (createObject("roSGNode","GridScreen")).

`extends` specifies the name of the built-in or 
extended SceneGraph scene or node class whose functionality is extended by this component. 

`initialFocus` specifies the ID of a node declared in the XML file to have the initial focus when the component is instantiated.

--------<interface>--------
The <interface> element defines a set of fields to be exposed by a component,
to allow instances of the component to be manipulated externally to the component.
The <interface> element may include one or more <field> XML elements. 
Each <field> XML element defines a top-level field for the XML component. 
These top-level fields define an interface that allow users of the component to read, write, and observe the fields.

    <interface>
        <field id="content" type="node" alias="RowList.content" />
        <interface/>

`id` string containing the name of the field
`type` case-insensitive string containing the type of the field
`alias` to link a filed from other component to make it available to this component.
ex- node.filedName
The type of the component child node field must match the type attribute.

`value` initial value

`onChange` The value of the attribute is a call-back function name in BrightScript code associated with the component.
it is similar to 
ObserveField("filedName", "method name")

`alwaysNotify` boolean indicates whether the field observer functions should be notified every time the field value is set
or only when the value changes.

---------<script>--------
<script type="text/brightscript" uri="RowListItem.brs" />

this allows the defination of the functions to initialize the component, response to events or filed value changes. 
this is to define the brightscript file uri that provides the behaviour to this component.

-there are two functions that are declared specifically for use in SceneGraph component <script> elements:

init()
onKeyEvent()

`type` string defined type of the script
ex - "text/brightscript" for BrightScript file

`uri` string specifying an external file that contains script code associated with the component.
 This file must be located in the pkg:/components directory of the application, and have the .brs extension for BrightScript code.
 If the uri does not specify a complete pkg: file path, the uri will be interpreted as a file path relative to the XML file.

 <script type = "text/brightscript" >

  <![CDATA[

  function createStopwatch(parent as object) as object
    stopWatch = m.top.createChild("StopWatch")
    stopWatch.translation = [100, 200]
    return stopwatch
  end function

  ]]>

</script>

or 

<script type="text/brightscript" uri="RowListItem.brs" />

------<children>------

the <children> element contains the SceneGraph node XML elements.



Widgets 

LayoutGroup -> LinearLayout 