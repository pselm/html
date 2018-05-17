
-- | A port of Elm's HTML library to Purescript. 

module Html
    ( Html
    , Attribute
    , text
    , node
    , map
    , beginnerProgram
    , program
    , programWithFlags
    , h1
    , h2
    , h3
    , h4
    , h5
    , h6
    , div
    , p
    , hr
    , pre
    , blockquote
    , span
    , a
    , code
    , em
    , strong
    , i
    , b
    , u
    , sub
    , sup
    , br
    , ol
    , ul
    , li
    , dl
    , dt
    , dd
    , img
    , iframe
    , canvas
    , math
    , form
    , input
    , textarea
    , button
    , select
    , option
    , section
    , nav
    , article
    , aside
    , header
    , footer
    , address
    , main_
    , body
    , figure
    , figcaption
    , table
    , caption
    , colgroup
    , col
    , tbody
    , thead
    , tfoot
    , tr
    , td
    , th
    , fieldset
    , legend
    , label
    , datalist
    , optgroup
    , keygen
    , output
    , progress
    , meter
    , audio
    , video
    , source
    , track
    , embed
    , object
    , param
    , ins
    , del
    , small
    , cite
    , dfn
    , abbr
    , time
    , var
    , samp
    , kbd
    , s
    , q
    , mark
    , ruby
    , rt
    , rp
    , bdi
    , bdo
    , wbr
    , details
    , summary
    , menuitem
    , menu
    )
    where

import Elm.Default
import Data.Tuple.Nested (type (/\))
import Elm.Monoid (none)
import Elm.Platform.Cmd ((!))
import Elm.VirtualDom as VirtualDom


-- CORE TYPES


-- | The core building block used to build up HTML. Here we create an `Html`
-- | value with no attributes and one child:
-- |
-- |     hello : Html msg
-- |     hello =
-- |       div [] [ text "Hello!" ]
type Html msg =
    VirtualDom.Node msg


-- | Set attributes on your `Html`. Learn more in the
-- | [`Html.Attributes`](Html-Attributes) module.
type Attribute msg =
    VirtualDom.Property msg



-- PRIMITIVES


-- | General way to create HTML nodes. It is used to define all of the helper
-- | functions in this library.
-- |
-- |     div : List (Attribute msg) -> List (Html msg) -> Html msg
-- |     div attributes children =
-- |         node "div" attributes children
-- |
-- | You can use this to create custom nodes if you need to create something that
-- | is not covered by the helper functions in this library.
node :: ∀ msg. String -> List (Attribute msg) -> List (Html msg) -> Html msg
node =
    VirtualDom.node


-- | Just put plain text in the DOM. It will escape the string so that it appears
-- | exactly as you specify.
-- |
-- |     text "Hello World!"
text :: ∀ msg. String -> Html msg
text =
    VirtualDom.text



-- NESTING VIEWS


-- | Transform the messages produced by some `Html`. In the following example,
-- | we have `viewButton` that produces `()` messages, and we transform those values
-- | into `Msg` values in `view`.
-- |
-- |     type Msg = Left | Right
-- |
-- |     view : model -> Html Msg
-- |     view model =
-- |       div []
-- |         [ map (\_ -> Left) (viewButton "Left")
-- |         , map (\_ -> Right) (viewButton "Right")
-- |         ]
-- |
-- |     viewButton : String -> Html ()
-- |     viewButton name =
-- |       button [ onClick () ] [ text name ]
-- |
-- | This should not come in handy too often. Definitely read [this][reuse] before
-- | deciding if this is what you want.
-- |
-- | [reuse]: https://guide.elm-lang.org/reuse/
map :: ∀ msg a. (a -> msg) -> Html a -> Html msg
map =
    VirtualDom.map



-- CREATING PROGRAMS


-- | Create a [`Program`][program] that describes how your whole app works.
-- |
-- | Read about [The Elm Architecture][tea] to learn how to use this. Just do it.
-- | The additional context is very worthwhile! (Honestly, it is best to just read
-- | that guide from front to back instead of muddling around and reading it
-- | piecemeal.)
-- |
-- | [program]: http://package.elm-lang.org/packages/elm-lang/core/latest/Platform#Program
-- | [tea]: https://guide.elm-lang.org/architecture/
beginnerProgram :: ∀ msg model.
    { model :: model
    , view :: model -> Html msg
    , update :: msg -> model -> model
    }
    -> Program Never model msg
beginnerProgram { model, view, update } =
    program
        { init : model ! []
        , update : \msg model -> update msg model ! []
        , view : view
        , subscriptions : \_ -> none
        }


-- | Create a [`Program`][program] that describes how your whole app works.
-- |
-- | Read about [The Elm Architecture][tea] to learn how to use this. Just do it.
-- | Commands and subscriptions make way more sense when you work up to them
-- | gradually and see them in context with examples.
-- |
-- | [program]: http://package.elm-lang.org/packages/elm-lang/core/latest/Platform#Program
-- | [tea]: https://guide.elm-lang.org/architecture/
program :: ∀ msg model.
    { init :: ( model /\ Cmd msg )
    , update :: msg -> model -> ( model /\ Cmd msg )
    , subscriptions :: model -> Sub msg
    , view :: model -> Html msg
    }
    -> Program Never model msg
program =
    VirtualDom.program


-- | Create a [`Program`][program] that describes how your whole app works.
-- |
-- | It works just like `program` but you can provide &ldquo;flags&rdquo; from
-- | JavaScript to configure your application. Read more about that [here][].
-- |
-- | [program]: http://package.elm-lang.org/packages/elm-lang/core/latest/Platform#Program
-- | [here]: https://guide.elm-lang.org/interop/javascript.html
programWithFlags :: ∀ flags msg model.
    { init :: flags -> ( model /\ Cmd msg )
    , update :: msg -> model -> ( model /\ Cmd msg )
    , subscriptions :: model -> Sub msg
    , view :: model -> Html msg
    }
    -> Program flags model msg
programWithFlags =
    VirtualDom.programWithFlags



-- SECTIONS


-- | Represents the content of an HTML document. There is only one `body`
-- | element in a document.
body :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
body =
    node "body"


-- | Defines a section in a document.
section :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
section =
    node "section"


-- | Defines a section that contains only navigation links.
nav :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
nav =
    node "nav"


-- | Defines self-contained content that could exist independently of the rest
-- | of the content.
article :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
article =
    node "article"


-- | Defines some content loosely related to the page content. If it is removed,
-- | the remaining content still makes sense.
aside :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
aside =
    node "aside"


-- |
h1 :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
h1 =
    node "h1"


-- |
h2 :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
h2 =
    node "h2"


-- |
h3 :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
h3 =
    node "h3"


-- |
h4 :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
h4 =
    node "h4"


-- |
h5 :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
h5 =
    node "h5"


-- |
h6 :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
h6 =
    node "h6"


-- | Defines the header of a page or section. It often contains a logo, the
-- | title of the web site, and a navigational table of content.
header :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
header =
    node "header"


-- | Defines the footer for a page or section. It often contains a copyright
-- | notice, some links to legal information, or addresses to give feedback.
footer :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
footer =
    node "footer"


-- | Defines a section containing contact information.
address :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
address =
    node "address"


-- | Defines the main or important content in the document. There is only one
-- | `main` element in the document.
main_ :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
main_ =
    node "main"



-- GROUPING CONTENT


-- | Defines a portion that should be displayed as a paragraph.
p :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
p =
    node "p"


-- | Represents a thematic break between paragraphs of a section or article or
-- | any longer content.
hr :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
hr =
    node "hr"


-- | Indicates that its content is preformatted and that this format must be
-- | preserved.
pre :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
pre =
    node "pre"


-- | Represents a content that is quoted from another source.
blockquote :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
blockquote =
    node "blockquote"


-- | Defines an ordered list of items.
ol :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
ol =
    node "ol"


-- | Defines an unordered list of items.
ul :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
ul =
    node "ul"


-- | Defines a item of an enumeration list.
li :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
li =
    node "li"


-- | Defines a definition list, that is, a list of terms and their associated
-- | definitions.
dl :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
dl =
    node "dl"


-- | Represents a term defined by the next `dd`.
dt :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
dt =
    node "dt"


-- | Represents the definition of the terms immediately listed before it.
dd :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
dd =
    node "dd"


-- | Represents a figure illustrated as part of the document.
figure :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
figure =
    node "figure"


-- | Represents the legend of a figure.
figcaption :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
figcaption =
    node "figcaption"


-- | Represents a generic container with no special meaning.
div :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
div =
    node "div"



-- TEXT LEVEL SEMANTIC


-- | Represents a hyperlink, linking to another resource.
a :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
a =
    node "a"


-- | Represents emphasized text, like a stress accent.
em :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
em =
    node "em"


-- | Represents especially important text.
strong :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
strong =
    node "strong"


-- | Represents a side comment, that is, text like a disclaimer or a
-- | copyright, which is not essential to the comprehension of the document.
small :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
small =
    node "small"


-- | Represents content that is no longer accurate or relevant.
s :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
s =
    node "s"


-- | Represents the title of a work.
cite :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
cite =
    node "cite"


-- | Represents an inline quotation.
q :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
q =
    node "q"


-- | Represents a term whose definition is contained in its nearest ancestor
-- | content.
dfn :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
dfn =
    node "dfn"


-- | Represents an abbreviation or an acronym; the expansion of the
-- | abbreviation can be represented in the title attribute.
abbr :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
abbr =
    node "abbr"


-- | Represents a date and time value; the machine-readable equivalent can be
-- | represented in the datetime attribute.
time :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
time =
    node "time"


-- | Represents computer code.
code :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
code =
    node "code"


-- | Represents a variable. Specific cases where it should be used include an
-- | actual mathematical expression or programming context, an identifier
-- | representing a constant, a symbol identifying a physical quantity, a function
-- | parameter, or a mere placeholder in prose.
var :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
var =
    node "var"


-- | Represents the output of a program or a computer.
samp :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
samp =
    node "samp"


-- | Represents user input, often from the keyboard, but not necessarily; it
-- | may represent other input, like transcribed voice commands.
kbd :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
kbd =
    node "kbd"


-- | Represent a subscript.
sub :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
sub =
    node "sub"


-- | Represent a superscript.
sup :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
sup =
    node "sup"


-- | Represents some text in an alternate voice or mood, or at least of
-- | different quality, such as a taxonomic designation, a technical term, an
-- | idiomatic phrase, a thought, or a ship name.
i :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
i =
    node "i"


-- | Represents a text which to which attention is drawn for utilitarian
-- | purposes. It doesn't convey extra importance and doesn't imply an alternate
-- | voice.
b :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
b =
    node "b"


-- | Represents a non-textual annoatation for which the conventional
-- | presentation is underlining, such labeling the text as being misspelt or
-- | labeling a proper name in Chinese text.
u :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
u =
    node "u"


-- | Represents text highlighted for reference purposes, that is for its
-- | relevance in another context.
mark :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
mark =
    node "mark"


-- | Represents content to be marked with ruby annotations, short runs of text
-- | presented alongside the text. This is often used in conjunction with East Asian
-- | language where the annotations act as a guide for pronunciation, like the
-- | Japanese furigana.
ruby :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
ruby =
    node "ruby"


-- | Represents the text of a ruby annotation.
rt :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
rt =
    node "rt"


-- | Represents parenthesis around a ruby annotation, used to display the
-- | annotation in an alternate way by browsers not supporting the standard display
-- | for annotations.
rp :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
rp =
    node "rp"


-- | Represents text that must be isolated from its surrounding for
-- | bidirectional text formatting. It allows embedding a span of text with a
-- | different, or unknown, directionality.
bdi :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
bdi =
    node "bdi"


-- | Represents the directionality of its children, in order to explicitly
-- | override the Unicode bidirectional algorithm.
bdo :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
bdo =
    node "bdo"


-- | Represents text with no specific meaning. This has to be used when no other
-- | text-semantic element conveys an adequate meaning, which, in this case, is
-- | often brought by global attributes like `class`, `lang`, or `dir`.
span :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
span =
    node "span"


-- | Represents a line break.
br :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
br =
    node "br"


-- | Represents a line break opportunity, that is a suggested point for
-- | wrapping text in order to improve readability of text split on several lines.
wbr :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
wbr =
    node "wbr"



-- EDITS


-- | Defines an addition to the document.
ins :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
ins =
    node "ins"


-- | Defines a removal from the document.
del :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
del =
    node "del"



-- EMBEDDED CONTENT


-- | Represents an image.
img :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
img =
    node "img"


-- | Embedded an HTML document.
iframe :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
iframe =
    node "iframe"


-- | Represents a integration point for an external, often non-HTML,
-- | application or interactive content.
embed :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
embed =
    node "embed"


-- | Represents an external resource, which is treated as an image, an HTML
-- | sub-document, or an external resource to be processed by a plug-in.
object :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
object =
    node "object"


-- | Defines parameters for use by plug-ins invoked by `object` elements.
param :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
param =
    node "param"


-- | Represents a video, the associated audio and captions, and controls.
video :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
video =
    node "video"


-- | Represents a sound or audio stream.
audio :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
audio =
    node "audio"


-- | Allows authors to specify alternative media resources for media elements
-- | like `video` or `audio`.
source :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
source =
    node "source"


-- | Allows authors to specify timed text track for media elements like `video`
-- | or `audio`.
track :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
track =
    node "track"


-- | Represents a bitmap area for graphics rendering.
canvas :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
canvas =
    node "canvas"


-- | Defines a mathematical formula.
math :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
math =
    node "math"



-- TABULAR DATA


-- | Represents data with more than one dimension.
table :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
table =
    node "table"


-- | Represents the title of a table.
caption :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
caption =
    node "caption"


-- | Represents a set of one or more columns of a table.
colgroup :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
colgroup =
    node "colgroup"


-- | Represents a column of a table.
col :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
col =
    node "col"


-- | Represents the block of rows that describes the concrete data of a table.
tbody :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
tbody =
    node "tbody"


-- | Represents the block of rows that describes the column labels of a table.
thead :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
thead =
    node "thead"


-- | Represents the block of rows that describes the column summaries of a table.
tfoot :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
tfoot =
    node "tfoot"


-- | Represents a row of cells in a table.
tr :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
tr =
    node "tr"


-- | Represents a data cell in a table.
td :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
td =
    node "td"


-- | Represents a header cell in a table.
th :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
th =
    node "th"



-- FORMS


-- | Represents a form, consisting of controls, that can be submitted to a
-- | server for processing.
form :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
form =
    node "form"


-- | Represents a set of controls.
fieldset :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
fieldset =
    node "fieldset"


-- | Represents the caption for a `fieldset`.
legend :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
legend =
    node "legend"


-- | Represents the caption of a form control.
label :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
label =
    node "label"


-- | Represents a typed data field allowing the user to edit the data.
input :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
input =
    node "input"


-- | Represents a button.
button :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
button =
    node "button"


-- | Represents a control allowing selection among a set of options.
select :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
select =
    node "select"


-- | Represents a set of predefined options for other controls.
datalist :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
datalist =
    node "datalist"


-- | Represents a set of options, logically grouped.
optgroup :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
optgroup =
    node "optgroup"


-- | Represents an option in a `select` element or a suggestion of a `datalist`
-- | element.
option :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
option =
    node "option"


-- | Represents a multiline text edit control.
textarea :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
textarea =
    node "textarea"


-- | Represents a key-pair generator control.
keygen :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
keygen =
    node "keygen"


-- | Represents the result of a calculation.
output :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
output =
    node "output"


-- | Represents the completion progress of a task.
progress :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
progress =
    node "progress"


-- | Represents a scalar measurement (or a fractional value), within a known
-- | range.
meter :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
meter =
    node "meter"



-- INTERACTIVE ELEMENTS


-- | Represents a widget from which the user can obtain additional information
-- | or controls.
details :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
details =
    node "details"


-- | Represents a summary, caption, or legend for a given `details`.
summary :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
summary =
    node "summary"


-- | Represents a command that the user can invoke.
menuitem :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
menuitem =
    node "menuitem"


-- | Represents a list of commands.
menu :: ∀ msg. List (Attribute msg) -> List (Html msg) -> Html msg
menu =
    node "menu"
