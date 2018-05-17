## Module Html.Attributes

Helper functions for HTML attributes. They are organized roughly by
category. Each attribute is labeled with the HTML tags it can be used with, so
just search the page for `video` if you want video stuff.

If you cannot find what you are looking for, go to the [Custom
Attributes](#custom-attributes) section to learn how to create new helpers.

#### `style`

``` purescript
style :: forall msg. List (String /\ String) -> Attribute msg
```

Specify a list of styles.

    myStyle : Attribute msg
    myStyle =
      style
        [ ("backgroundColor", "red")
        , ("height", "90px")
        , ("width", "100%")
        ]

    greeting : Html msg
    greeting =
      div [ myStyle ] [ text "Hello!" ]

There is no `Html.Styles` module because best practices for working with HTML
suggest that this should primarily be specified in CSS files. So the general
recommendation is to use this function lightly.

#### `property`

``` purescript
property :: forall msg. String -> Value -> Attribute msg
```

Create *properties*, like saying `domNode.className = 'greeting'` in
JavaScript.

    import Json.Encode as Encode

    class : String -> Attribute msg
    class name =
      property "className" (Encode.string name)

Read more about the difference between properties and attributes [here][].

[here]: https://github.com/elm-lang/html/blob/master/properties-vs-attributes.md

#### `attribute`

``` purescript
attribute :: forall msg. String -> String -> Attribute msg
```

Create *attributes*, like saying `domNode.setAttribute('class', 'greeting')`
in JavaScript.

    class : String -> Attribute msg
    class name =
      attribute "class" name

Read more about the difference between properties and attributes [here][].

[here]: https://github.com/elm-lang/html/blob/master/properties-vs-attributes.md

#### `map`

``` purescript
map :: forall msg a. (a -> msg) -> Attribute a -> Attribute msg
```

Transform the messages produced by an `Attribute`.

#### `class_`

``` purescript
class_ :: forall msg. String -> Attribute msg
```

Often used with CSS to style elements with common properties.

#### `classList`

``` purescript
classList :: forall msg. List (String /\ Bool) -> Attribute msg
```

This function makes it easier to build a space-separated class attribute.
Each class can easily be added and removed depending on the boolean value it
is paired with.

    renderMessage : Msg -> Html
    renderMessage msg =
      div
        [
          classList [
            ("message", True),
            ("message-important", msg.isImportant),
            ("message-read", msg.isRead)
          ]
        ]
        [ text msg.content ]

#### `id`

``` purescript
id :: forall msg. String -> Attribute msg
```

Often used with CSS to style a specific element. The value of this
attribute must be unique.

#### `title`

``` purescript
title :: forall msg. String -> Attribute msg
```

Text to be displayed in a tooltip when hovering over the element.

#### `hidden`

``` purescript
hidden :: forall msg. Bool -> Attribute msg
```

Indicates the relevance of an element.

#### `type_`

``` purescript
type_ :: forall msg. String -> Attribute msg
```

Defines the type of a `button`, `input`, `embed`, `object`, `script`,
`source`, `style`, or `menu`.

#### `value`

``` purescript
value :: forall msg. String -> Attribute msg
```

Defines a default value which will be displayed in a `button`, `option`,
`input`, `li`, `meter`, `progress`, or `param`.

#### `defaultValue`

``` purescript
defaultValue :: forall msg. String -> Attribute msg
```

Defines an initial value which will be displayed in an `input` when that
`input` is added to the DOM. Unlike `value`, altering `defaultValue` after the
`input` element has been added to the DOM has no effect.

#### `checked`

``` purescript
checked :: forall msg. Bool -> Attribute msg
```

Indicates whether an `input` of type checkbox is checked.

#### `placeholder`

``` purescript
placeholder :: forall msg. String -> Attribute msg
```

Provides a hint to the user of what can be entered into an `input` or
`textarea`.

#### `selected`

``` purescript
selected :: forall msg. Bool -> Attribute msg
```

Defines which `option` will be selected on page load.

#### `accept`

``` purescript
accept :: forall msg. String -> Attribute msg
```

List of types the server accepts, typically a file type.
For `form` and `input`.

#### `acceptCharset`

``` purescript
acceptCharset :: forall msg. String -> Attribute msg
```

List of supported charsets in a `form`.

#### `action`

``` purescript
action :: forall msg. String -> Attribute msg
```

The URI of a program that processes the information submitted via a `form`.

#### `autocomplete`

``` purescript
autocomplete :: forall msg. Bool -> Attribute msg
```

Indicates whether a `form` or an `input` can have their values automatically
completed by the browser.

#### `autofocus`

``` purescript
autofocus :: forall msg. Bool -> Attribute msg
```

The element should be automatically focused after the page loaded.
For `button`, `input`, `keygen`, `select`, and `textarea`.

#### `disabled`

``` purescript
disabled :: forall msg. Bool -> Attribute msg
```

Indicates whether the user can interact with a `button`, `fieldset`,
`input`, `keygen`, `optgroup`, `option`, `select` or `textarea`.

#### `enctype`

``` purescript
enctype :: forall msg. String -> Attribute msg
```

How `form` data should be encoded when submitted with the POST method.
Options include: application/x-www-form-urlencoded, multipart/form-data, and
text/plain.

#### `formaction`

``` purescript
formaction :: forall msg. String -> Attribute msg
```

Indicates the action of an `input` or `button`. This overrides the action
defined in the surrounding `form`.

#### `list`

``` purescript
list :: forall msg. String -> Attribute msg
```

Associates an `input` with a `datalist` tag. The datalist gives some
pre-defined options to suggest to the user as they interact with an input.
The value of the list attribute must match the id of a `datalist` node.
For `input`.

#### `maxlength`

``` purescript
maxlength :: forall msg. Int -> Attribute msg
```

Defines the maximum number of characters allowed in an `input` or
`textarea`.

#### `minlength`

``` purescript
minlength :: forall msg. Int -> Attribute msg
```

Defines the minimum number of characters allowed in an `input` or
`textarea`.

#### `method`

``` purescript
method :: forall msg. String -> Attribute msg
```

Defines which HTTP method to use when submitting a `form`. Can be GET
(default) or POST.

#### `multiple`

``` purescript
multiple :: forall msg. Bool -> Attribute msg
```

Indicates whether multiple values can be entered in an `input` of type
email or file. Can also indicate that you can `select` many options.

#### `name`

``` purescript
name :: forall msg. String -> Attribute msg
```

Name of the element. For example used by the server to identify the fields
in form submits. For `button`, `form`, `fieldset`, `iframe`, `input`, `keygen`,
`object`, `output`, `select`, `textarea`, `map`, `meta`, and `param`.

#### `novalidate`

``` purescript
novalidate :: forall msg. Bool -> Attribute msg
```

This attribute indicates that a `form` shouldn't be validated when
submitted.

#### `pattern`

``` purescript
pattern :: forall msg. String -> Attribute msg
```

Defines a regular expression which an `input`'s value will be validated
against.

#### `readonly`

``` purescript
readonly :: forall msg. Bool -> Attribute msg
```

Indicates whether an `input` or `textarea` can be edited.

#### `required`

``` purescript
required :: forall msg. Bool -> Attribute msg
```

Indicates whether this element is required to fill out or not.
For `input`, `select`, and `textarea`.

#### `size`

``` purescript
size :: forall msg. Int -> Attribute msg
```

For `input` specifies the width of an input in characters.

For `select` specifies the number of visible options in a drop-down list.

#### `for`

``` purescript
for :: forall msg. String -> Attribute msg
```

The element ID described by this `label` or the element IDs that are used
for an `output`.

#### `form`

``` purescript
form :: forall msg. String -> Attribute msg
```

Indicates the element ID of the `form` that owns this particular `button`,
`fieldset`, `input`, `keygen`, `label`, `meter`, `object`, `output`,
`progress`, `select`, or `textarea`.

#### `max`

``` purescript
max :: forall msg. String -> Attribute msg
```

Indicates the maximum value allowed. When using an input of type number or
date, the max value must be a number or date. For `input`, `meter`, and `progress`.

#### `min`

``` purescript
min :: forall msg. String -> Attribute msg
```

Indicates the minimum value allowed. When using an input of type number or
date, the min value must be a number or date. For `input` and `meter`.

#### `step`

``` purescript
step :: forall msg. String -> Attribute msg
```

Add a step size to an `input`. Use `step "any"` to allow any floating-point
number to be used in the input.

#### `cols`

``` purescript
cols :: forall msg. Int -> Attribute msg
```

Defines the number of columns in a `textarea`.

#### `rows`

``` purescript
rows :: forall msg. Int -> Attribute msg
```

Defines the number of rows in a `textarea`.

#### `wrap`

``` purescript
wrap :: forall msg. String -> Attribute msg
```

Indicates whether the text should be wrapped in a `textarea`. Possible
values are "hard" and "soft".

#### `href`

``` purescript
href :: forall msg. String -> Attribute msg
```

The URL of a linked resource, such as `a`, `area`, `base`, or `link`.

#### `target`

``` purescript
target :: forall msg. String -> Attribute msg
```

Specify where the results of clicking an `a`, `area`, `base`, or `form`
should appear. Possible special values include:

  * _blank &mdash; a new window or tab
  * _self &mdash; the same frame (this is default)
  * _parent &mdash; the parent frame
  * _top &mdash; the full body of the window

You can also give the name of any `frame` you have created.

#### `download`

``` purescript
download :: forall msg. Bool -> Attribute msg
```

Indicates that clicking an `a` and `area` will download the resource
directly.

#### `downloadAs`

``` purescript
downloadAs :: forall msg. String -> Attribute msg
```

Indicates that clicking an `a` and `area` will download the resource
directly, and that the downloaded resource with have the given filename.

#### `hreflang`

``` purescript
hreflang :: forall msg. String -> Attribute msg
```

Two-letter language code of the linked resource of an `a`, `area`, or `link`.

#### `media`

``` purescript
media :: forall msg. String -> Attribute msg
```

Specifies a hint of the target media of a `a`, `area`, `link`, `source`,
or `style`.

#### `ping`

``` purescript
ping :: forall msg. String -> Attribute msg
```

Specify a URL to send a short POST request to when the user clicks on an
`a` or `area`. Useful for monitoring and tracking.

#### `rel`

``` purescript
rel :: forall msg. String -> Attribute msg
```

Specifies the relationship of the target object to the link object.
For `a`, `area`, `link`.

#### `ismap`

``` purescript
ismap :: forall msg. Bool -> Attribute msg
```

When an `img` is a descendent of an `a` tag, the `ismap` attribute
indicates that the click location should be added to the parent `a`'s href as
a query string.

#### `usemap`

``` purescript
usemap :: forall msg. String -> Attribute msg
```

Specify the hash name reference of a `map` that should be used for an `img`
or `object`. A hash name reference is a hash symbol followed by the element's name or id.
E.g. `"#planet-map"`.

#### `shape`

``` purescript
shape :: forall msg. String -> Attribute msg
```

Declare the shape of the clickable area in an `a` or `area`. Valid values
include: default, rect, circle, poly. This attribute can be paired with
`coords` to create more particular shapes.

#### `coords`

``` purescript
coords :: forall msg. String -> Attribute msg
```

A set of values specifying the coordinates of the hot-spot region in an
`area`. Needs to be paired with a `shape` attribute to be meaningful.

#### `src`

``` purescript
src :: forall msg. String -> Attribute msg
```

The URL of the embeddable content. For `audio`, `embed`, `iframe`, `img`,
`input`, `script`, `source`, `track`, and `video`.

#### `height`

``` purescript
height :: forall msg. Int -> Attribute msg
```

Declare the height of a `canvas`, `embed`, `iframe`, `img`, `input`,
`object`, or `video`.

#### `width`

``` purescript
width :: forall msg. Int -> Attribute msg
```

Declare the width of a `canvas`, `embed`, `iframe`, `img`, `input`,
`object`, or `video`.

#### `alt`

``` purescript
alt :: forall msg. String -> Attribute msg
```

Alternative text in case an image can't be displayed. Works with `img`,
`area`, and `input`.

#### `autoplay`

``` purescript
autoplay :: forall msg. Bool -> Attribute msg
```

The `audio` or `video` should play as soon as possible.

#### `controls`

``` purescript
controls :: forall msg. Bool -> Attribute msg
```

Indicates whether the browser should show playback controls for the `audio`
or `video`.

#### `loop`

``` purescript
loop :: forall msg. Bool -> Attribute msg
```

Indicates whether the `audio` or `video` should start playing from the
start when it's finished.

#### `preload`

``` purescript
preload :: forall msg. String -> Attribute msg
```

Control how much of an `audio` or `video` resource should be preloaded.

#### `poster`

``` purescript
poster :: forall msg. String -> Attribute msg
```

A URL indicating a poster frame to show until the user plays or seeks the
`video`.

#### `default`

``` purescript
default :: forall msg. Bool -> Attribute msg
```

Indicates that the `track` should be enabled unless the user's preferences
indicate something different.

#### `kind`

``` purescript
kind :: forall msg. String -> Attribute msg
```

Specifies the kind of text `track`.

#### `srclang`

``` purescript
srclang :: forall msg. String -> Attribute msg
```

A two letter language code indicating the language of the `track` text data.

#### `sandbox`

``` purescript
sandbox :: forall msg. String -> Attribute msg
```

A space separated list of security restrictions you'd like to lift for an
`iframe`.

#### `seamless`

``` purescript
seamless :: forall msg. Bool -> Attribute msg
```

Make an `iframe` look like part of the containing document.

#### `srcdoc`

``` purescript
srcdoc :: forall msg. String -> Attribute msg
```

An HTML document that will be displayed as the body of an `iframe`. It will
override the content of the `src` attribute if it has been specified.

#### `reversed`

``` purescript
reversed :: forall msg. Bool -> Attribute msg
```

Indicates whether an ordered list `ol` should be displayed in a descending
order instead of a ascending.

#### `start`

``` purescript
start :: forall msg. Int -> Attribute msg
```

Defines the first number of an ordered list if you want it to be something
besides 1.

#### `align`

``` purescript
align :: forall msg. String -> Attribute msg
```

Specifies the horizontal alignment of a `caption`, `col`, `colgroup`,
`hr`, `iframe`, `img`, `table`, `tbody`,  `td`,  `tfoot`, `th`, `thead`, or
`tr`.

#### `colspan`

``` purescript
colspan :: forall msg. Int -> Attribute msg
```

The colspan attribute defines the number of columns a cell should span.
For `td` and `th`.

#### `rowspan`

``` purescript
rowspan :: forall msg. Int -> Attribute msg
```

Defines the number of rows a table cell should span over.
For `td` and `th`.

#### `headers`

``` purescript
headers :: forall msg. String -> Attribute msg
```

A space separated list of element IDs indicating which `th` elements are
headers for this cell. For `td` and `th`.

#### `scope`

``` purescript
scope :: forall msg. String -> Attribute msg
```

Specifies the scope of a header cell `th`. Possible values are: col, row,
colgroup, rowgroup.

#### `async`

``` purescript
async :: forall msg. Bool -> Attribute msg
```

Indicates that the `script` should be executed asynchronously.

#### `charset`

``` purescript
charset :: forall msg. String -> Attribute msg
```

Declares the character encoding of the page or script. Common values include:

  * UTF-8 - Character encoding for Unicode
  * ISO-8859-1 - Character encoding for the Latin alphabet

For `meta` and `script`.

#### `content`

``` purescript
content :: forall msg. String -> Attribute msg
```

A value associated with http-equiv or name depending on the context. For
`meta`.

#### `defer`

``` purescript
defer :: forall msg. Bool -> Attribute msg
```

Indicates that a `script` should be executed after the page has been
parsed.

#### `httpEquiv`

``` purescript
httpEquiv :: forall msg. String -> Attribute msg
```

This attribute is an indicator that is paired with the `content` attribute,
indicating what that content means. `httpEquiv` can take on three different
values: content-type, default-style, or refresh. For `meta`.

#### `language`

``` purescript
language :: forall msg. String -> Attribute msg
```

Defines the script language used in a `script`.

#### `scoped`

``` purescript
scoped :: forall msg. Bool -> Attribute msg
```

Indicates that a `style` should only apply to its parent and all of the
parents children.

#### `accesskey`

``` purescript
accesskey :: forall msg. Char -> Attribute msg
```

Defines a keyboard shortcut to activate or add focus to the element.

#### `contenteditable`

``` purescript
contenteditable :: forall msg. Bool -> Attribute msg
```

Indicates whether the element's content is editable.

#### `contextmenu`

``` purescript
contextmenu :: forall msg. String -> Attribute msg
```

Defines the ID of a `menu` element which will serve as the element's
context menu.

#### `dir`

``` purescript
dir :: forall msg. String -> Attribute msg
```

Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl
(Right-To-Left).

#### `draggable`

``` purescript
draggable :: forall msg. String -> Attribute msg
```

Defines whether the element can be dragged.

#### `dropzone`

``` purescript
dropzone :: forall msg. String -> Attribute msg
```

Indicates that the element accept the dropping of content on it.

#### `itemprop`

``` purescript
itemprop :: forall msg. String -> Attribute msg
```



#### `lang`

``` purescript
lang :: forall msg. String -> Attribute msg
```

Defines the language used in the element.

#### `spellcheck`

``` purescript
spellcheck :: forall msg. Bool -> Attribute msg
```

Indicates whether spell checking is allowed for the element.

#### `tabindex`

``` purescript
tabindex :: forall msg. Int -> Attribute msg
```

Overrides the browser's default tab order and follows the one specified
instead.

#### `challenge`

``` purescript
challenge :: forall msg. String -> Attribute msg
```

A challenge string that is submitted along with the public key in a `keygen`.

#### `keytype`

``` purescript
keytype :: forall msg. String -> Attribute msg
```

Specifies the type of key generated by a `keygen`. Possible values are:
rsa, dsa, and ec.

#### `cite`

``` purescript
cite :: forall msg. String -> Attribute msg
```

Contains a URI which points to the source of the quote or change in a
`blockquote`, `del`, `ins`, or `q`.

#### `datetime`

``` purescript
datetime :: forall msg. String -> Attribute msg
```

Indicates the date and time associated with the element.
For `del`, `ins`, `time`.

#### `pubdate`

``` purescript
pubdate :: forall msg. String -> Attribute msg
```

Indicates whether this date and time is the date of the nearest `article`
ancestor element. For `time`.

#### `manifest`

``` purescript
manifest :: forall msg. String -> Attribute msg
```

Specifies the URL of the cache manifest for an `html` tag.


