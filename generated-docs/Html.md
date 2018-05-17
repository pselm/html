## Module Html

A port of Elm's HTML library to Purescript. 

#### `Html`

``` purescript
type Html msg = Node msg
```

The core building block used to build up HTML. Here we create an `Html`
value with no attributes and one child:

    hello : Html msg
    hello =
      div [] [ text "Hello!" ]

#### `Attribute`

``` purescript
type Attribute msg = Property msg
```

Set attributes on your `Html`. Learn more in the
[`Html.Attributes`](Html-Attributes) module.

#### `text`

``` purescript
text :: forall msg. String -> Html msg
```

Just put plain text in the DOM. It will escape the string so that it appears
exactly as you specify.

    text "Hello World!"

#### `node`

``` purescript
node :: forall f g msg. Foldable f => Foldable g => String -> f (Attribute msg) -> g (Html msg) -> Html msg
```

General way to create HTML nodes. It is used to define all of the helper
functions in this library.

    div : List (Attribute msg) -> List (Html msg) -> Html msg
    div attributes children =
        node "div" attributes children

You can use this to create custom nodes if you need to create something that
is not covered by the helper functions in this library.

#### `map`

``` purescript
map :: forall msg a. (a -> msg) -> Html a -> Html msg
```

Transform the messages produced by some `Html`. In the following example,
we have `viewButton` that produces `()` messages, and we transform those values
into `Msg` values in `view`.

    type Msg = Left | Right

    view : model -> Html Msg
    view model =
      div []
        [ map (\_ -> Left) (viewButton "Left")
        , map (\_ -> Right) (viewButton "Right")
        ]

    viewButton : String -> Html ()
    viewButton name =
      button [ onClick () ] [ text name ]

This should not come in handy too often. Definitely read [this][reuse] before
deciding if this is what you want.

[reuse]: https://guide.elm-lang.org/reuse/

#### `beginnerProgram`

``` purescript
beginnerProgram :: forall msg model. { model :: model, view :: model -> Html msg, update :: msg -> model -> model } -> Program Unit model msg
```

Create a [`Program`][program] that describes how your whole app works.

Read about [The Elm Architecture][tea] to learn how to use this. Just do it.
The additional context is very worthwhile! (Honestly, it is best to just read
that guide from front to back instead of muddling around and reading it
piecemeal.)

[program]: http://package.elm-lang.org/packages/elm-lang/core/latest/Platform#Program
[tea]: https://guide.elm-lang.org/architecture/

#### `program`

``` purescript
program :: forall msg model. { init :: model /\ (Cmd msg), update :: msg -> model -> (model /\ (Cmd msg)), subscriptions :: model -> Sub msg, view :: model -> Html msg } -> Program Unit model msg
```

Create a [`Program`][program] that describes how your whole app works.

Read about [The Elm Architecture][tea] to learn how to use this. Just do it.
Commands and subscriptions make way more sense when you work up to them
gradually and see them in context with examples.

[program]: http://package.elm-lang.org/packages/elm-lang/core/latest/Platform#Program
[tea]: https://guide.elm-lang.org/architecture/

#### `programWithFlags`

``` purescript
programWithFlags :: forall flags msg model. { init :: flags -> (model /\ (Cmd msg)), update :: msg -> model -> (model /\ (Cmd msg)), subscriptions :: model -> Sub msg, view :: model -> Html msg } -> Program flags model msg
```

Create a [`Program`][program] that describes how your whole app works.

It works just like `program` but you can provide &ldquo;flags&rdquo; from
JavaScript to configure your application. Read more about that [here][].

[program]: http://package.elm-lang.org/packages/elm-lang/core/latest/Platform#Program
[here]: https://guide.elm-lang.org/interop/javascript.html

#### `h1`

``` purescript
h1 :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```



#### `h2`

``` purescript
h2 :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```



#### `h3`

``` purescript
h3 :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```



#### `h4`

``` purescript
h4 :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```



#### `h5`

``` purescript
h5 :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```



#### `h6`

``` purescript
h6 :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```



#### `div`

``` purescript
div :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a generic container with no special meaning.

#### `p`

``` purescript
p :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines a portion that should be displayed as a paragraph.

#### `hr`

``` purescript
hr :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a thematic break between paragraphs of a section or article or
any longer content.

#### `pre`

``` purescript
pre :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Indicates that its content is preformatted and that this format must be
preserved.

#### `blockquote`

``` purescript
blockquote :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a content that is quoted from another source.

#### `span`

``` purescript
span :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents text with no specific meaning. This has to be used when no other
text-semantic element conveys an adequate meaning, which, in this case, is
often brought by global attributes like `class`, `lang`, or `dir`.

#### `a`

``` purescript
a :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a hyperlink, linking to another resource.

#### `code`

``` purescript
code :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents computer code.

#### `em`

``` purescript
em :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents emphasized text, like a stress accent.

#### `strong`

``` purescript
strong :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents especially important text.

#### `i`

``` purescript
i :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents some text in an alternate voice or mood, or at least of
different quality, such as a taxonomic designation, a technical term, an
idiomatic phrase, a thought, or a ship name.

#### `b`

``` purescript
b :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a text which to which attention is drawn for utilitarian
purposes. It doesn't convey extra importance and doesn't imply an alternate
voice.

#### `u`

``` purescript
u :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a non-textual annoatation for which the conventional
presentation is underlining, such labeling the text as being misspelt or
labeling a proper name in Chinese text.

#### `sub`

``` purescript
sub :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represent a subscript.

#### `sup`

``` purescript
sup :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represent a superscript.

#### `br`

``` purescript
br :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a line break.

#### `ol`

``` purescript
ol :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines an ordered list of items.

#### `ul`

``` purescript
ul :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines an unordered list of items.

#### `li`

``` purescript
li :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines a item of an enumeration list.

#### `dl`

``` purescript
dl :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines a definition list, that is, a list of terms and their associated
definitions.

#### `dt`

``` purescript
dt :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a term defined by the next `dd`.

#### `dd`

``` purescript
dd :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents the definition of the terms immediately listed before it.

#### `img`

``` purescript
img :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents an image.

#### `iframe`

``` purescript
iframe :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Embedded an HTML document.

#### `canvas`

``` purescript
canvas :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a bitmap area for graphics rendering.

#### `math`

``` purescript
math :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines a mathematical formula.

#### `form`

``` purescript
form :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a form, consisting of controls, that can be submitted to a
server for processing.

#### `input`

``` purescript
input :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a typed data field allowing the user to edit the data.

#### `textarea`

``` purescript
textarea :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a multiline text edit control.

#### `button`

``` purescript
button :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a button.

#### `select`

``` purescript
select :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a control allowing selection among a set of options.

#### `option`

``` purescript
option :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents an option in a `select` element or a suggestion of a `datalist`
element.

#### `section`

``` purescript
section :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines a section in a document.

#### `nav`

``` purescript
nav :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines a section that contains only navigation links.

#### `article`

``` purescript
article :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines self-contained content that could exist independently of the rest
of the content.

#### `aside`

``` purescript
aside :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines some content loosely related to the page content. If it is removed,
the remaining content still makes sense.

#### `header`

``` purescript
header :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines the header of a page or section. It often contains a logo, the
title of the web site, and a navigational table of content.

#### `footer`

``` purescript
footer :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines the footer for a page or section. It often contains a copyright
notice, some links to legal information, or addresses to give feedback.

#### `address`

``` purescript
address :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines a section containing contact information.

#### `main_`

``` purescript
main_ :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines the main or important content in the document. There is only one
`main` element in the document.

#### `body`

``` purescript
body :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents the content of an HTML document. There is only one `body`
element in a document.

#### `figure`

``` purescript
figure :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a figure illustrated as part of the document.

#### `figcaption`

``` purescript
figcaption :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents the legend of a figure.

#### `table`

``` purescript
table :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents data with more than one dimension.

#### `caption`

``` purescript
caption :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents the title of a table.

#### `colgroup`

``` purescript
colgroup :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a set of one or more columns of a table.

#### `col`

``` purescript
col :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a column of a table.

#### `tbody`

``` purescript
tbody :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents the block of rows that describes the concrete data of a table.

#### `thead`

``` purescript
thead :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents the block of rows that describes the column labels of a table.

#### `tfoot`

``` purescript
tfoot :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents the block of rows that describes the column summaries of a table.

#### `tr`

``` purescript
tr :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a row of cells in a table.

#### `td`

``` purescript
td :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a data cell in a table.

#### `th`

``` purescript
th :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a header cell in a table.

#### `fieldset`

``` purescript
fieldset :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a set of controls.

#### `legend`

``` purescript
legend :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents the caption for a `fieldset`.

#### `label`

``` purescript
label :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents the caption of a form control.

#### `datalist`

``` purescript
datalist :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a set of predefined options for other controls.

#### `optgroup`

``` purescript
optgroup :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a set of options, logically grouped.

#### `keygen`

``` purescript
keygen :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a key-pair generator control.

#### `output`

``` purescript
output :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents the result of a calculation.

#### `progress`

``` purescript
progress :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents the completion progress of a task.

#### `meter`

``` purescript
meter :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a scalar measurement (or a fractional value), within a known
range.

#### `audio`

``` purescript
audio :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a sound or audio stream.

#### `video`

``` purescript
video :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a video, the associated audio and captions, and controls.

#### `source`

``` purescript
source :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Allows authors to specify alternative media resources for media elements
like `video` or `audio`.

#### `track`

``` purescript
track :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Allows authors to specify timed text track for media elements like `video`
or `audio`.

#### `embed`

``` purescript
embed :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a integration point for an external, often non-HTML,
application or interactive content.

#### `object`

``` purescript
object :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents an external resource, which is treated as an image, an HTML
sub-document, or an external resource to be processed by a plug-in.

#### `param`

``` purescript
param :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines parameters for use by plug-ins invoked by `object` elements.

#### `ins`

``` purescript
ins :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines an addition to the document.

#### `del`

``` purescript
del :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Defines a removal from the document.

#### `small`

``` purescript
small :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a side comment, that is, text like a disclaimer or a
copyright, which is not essential to the comprehension of the document.

#### `cite`

``` purescript
cite :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents the title of a work.

#### `dfn`

``` purescript
dfn :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a term whose definition is contained in its nearest ancestor
content.

#### `abbr`

``` purescript
abbr :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents an abbreviation or an acronym; the expansion of the
abbreviation can be represented in the title attribute.

#### `time`

``` purescript
time :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a date and time value; the machine-readable equivalent can be
represented in the datetime attribute.

#### `var`

``` purescript
var :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a variable. Specific cases where it should be used include an
actual mathematical expression or programming context, an identifier
representing a constant, a symbol identifying a physical quantity, a function
parameter, or a mere placeholder in prose.

#### `samp`

``` purescript
samp :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents the output of a program or a computer.

#### `kbd`

``` purescript
kbd :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents user input, often from the keyboard, but not necessarily; it
may represent other input, like transcribed voice commands.

#### `s`

``` purescript
s :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents content that is no longer accurate or relevant.

#### `q`

``` purescript
q :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents an inline quotation.

#### `mark`

``` purescript
mark :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents text highlighted for reference purposes, that is for its
relevance in another context.

#### `ruby`

``` purescript
ruby :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents content to be marked with ruby annotations, short runs of text
presented alongside the text. This is often used in conjunction with East Asian
language where the annotations act as a guide for pronunciation, like the
Japanese furigana.

#### `rt`

``` purescript
rt :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents the text of a ruby annotation.

#### `rp`

``` purescript
rp :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents parenthesis around a ruby annotation, used to display the
annotation in an alternate way by browsers not supporting the standard display
for annotations.

#### `bdi`

``` purescript
bdi :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents text that must be isolated from its surrounding for
bidirectional text formatting. It allows embedding a span of text with a
different, or unknown, directionality.

#### `bdo`

``` purescript
bdo :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents the directionality of its children, in order to explicitly
override the Unicode bidirectional algorithm.

#### `wbr`

``` purescript
wbr :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a line break opportunity, that is a suggested point for
wrapping text in order to improve readability of text split on several lines.

#### `details`

``` purescript
details :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a widget from which the user can obtain additional information
or controls.

#### `summary`

``` purescript
summary :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a summary, caption, or legend for a given `details`.

#### `menuitem`

``` purescript
menuitem :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a command that the user can invoke.

#### `menu`

``` purescript
menu :: forall f g msg. Foldable f => Foldable g => f (Attribute msg) -> g (Html msg) -> Html msg
```

Represents a list of commands.


