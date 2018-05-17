## Module Html.Events

> It is often helpful to create an [Union Type][] so you can have many different kinds
> of events as seen in the [TodoMVC][] example.
>
> [Union Type]: http://elm-lang.org/learn/Union-Types.elm
> [TodoMVC]: https://github.com/evancz/elm-todomvc/blob/master/Todo.elm

For Purescript, an `Eq` constraint has been added to a variety of function
signatures here. In most cases, you should be able to ask the compiler to
derive an `Eq` instance. If you really can't have an `Eq` instance, then
we could supply variants which don't require an `Eq` instance. (In fact,
if you look at the source, you ought to be able to construct them
yourself).

#### `onClick`

``` purescript
onClick :: forall msg. Eq msg => msg -> Attribute msg
```



#### `onDoubleClick`

``` purescript
onDoubleClick :: forall msg. Eq msg => msg -> Attribute msg
```



#### `onMouseDown`

``` purescript
onMouseDown :: forall msg. Eq msg => msg -> Attribute msg
```



#### `onMouseUp`

``` purescript
onMouseUp :: forall msg. Eq msg => msg -> Attribute msg
```



#### `onMouseEnter`

``` purescript
onMouseEnter :: forall msg. Eq msg => msg -> Attribute msg
```



#### `onMouseLeave`

``` purescript
onMouseLeave :: forall msg. Eq msg => msg -> Attribute msg
```



#### `onMouseOver`

``` purescript
onMouseOver :: forall msg. Eq msg => msg -> Attribute msg
```



#### `onMouseOut`

``` purescript
onMouseOut :: forall msg. Eq msg => msg -> Attribute msg
```



#### `onInput`

``` purescript
onInput :: forall msg. (String -> msg) -> Attribute msg
```

Capture [input](https://developer.mozilla.org/en-US/docs/Web/Events/input)
events for things like text fields or text areas.

It grabs the **string** value at `event.target.value`, so it will not work if
you need some other type of information. For example, if you want to track
inputs on a range slider, make a custom handler with [`on`](#on).

For more details on how `onInput` works, check out [targetValue](#targetValue).

#### `onCheck`

``` purescript
onCheck :: forall msg. (Bool -> msg) -> Attribute msg
```

Capture [change](https://developer.mozilla.org/en-US/docs/Web/Events/change)
events on checkboxes. It will grab the boolean value from `event.target.checked`
on any input event.

Check out [targetChecked](#targetChecked) for more details on how this works.

#### `onSubmit`

``` purescript
onSubmit :: forall msg. Eq msg => msg -> Attribute msg
```

Capture a [submit](https://developer.mozilla.org/en-US/docs/Web/Events/submit)
event with [`preventDefault`](https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault)
in order to prevent the form from changing the page’s location. If you need
different behavior, use `onWithOptions` to create a customized version of
`onSubmit`.

#### `onBlur`

``` purescript
onBlur :: forall msg. Eq msg => msg -> Attribute msg
```



#### `onFocus`

``` purescript
onFocus :: forall msg. Eq msg => msg -> Attribute msg
```



#### `on`

``` purescript
on :: forall msg. String -> Decoder msg -> Attribute msg
```

Create a custom event listener. Normally this will not be necessary, but
you have the power! Here is how `onClick` is defined for example:

    import Json.Decode as Json

    onClick : msg -> Attribute msg
    onClick message =
      on "click" (Json.succeed message)

The first argument is the event name in the same format as with JavaScript's
[`addEventListener`][aEL] function.

The second argument is a JSON decoder. Read more about these [here][decoder].
When an event occurs, the decoder tries to turn the event object into an Elm
value. If successful, the value is routed to your `update` function. In the
case of `onClick` we always just succeed with the given `message`.

If this is confusing, work through the [Elm Architecture Tutorial][tutorial].
It really does help!

[aEL]: https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener
[decoder]: http://package.elm-lang.org/packages/elm-lang/core/latest/Json-Decode
[tutorial]: https://github.com/evancz/elm-architecture-tutorial/

#### `onWithOptions`

``` purescript
onWithOptions :: forall msg. String -> Options -> Decoder msg -> Attribute msg
```

Same as `on` but you can set a few options.

#### `Options`

``` purescript
type Options = { stopPropagation :: Bool, preventDefault :: Bool }
```

Options for an event listener. If `stopPropagation` is true, it means the
event stops traveling through the DOM so it will not trigger any other event
listeners. If `preventDefault` is true, any built-in browser behavior related
to the event is prevented. For example, this is used with touch events when you
want to treat them as gestures of your own, not as scrolls.

#### `defaultOptions`

``` purescript
defaultOptions :: Options
```

Everything is `False` by default.

    defaultOptions =
        { stopPropagation = False
        , preventDefault = False
        }

#### `targetValue`

``` purescript
targetValue :: Decoder String
```

A `Json.Decoder` for grabbing `event.target.value`. We use this to define
`onInput` as follows:

    import Json.Decode as Json

    onInput : (String -> msg) -> Attribute msg
    onInput tagger =
      on "input" (Json.map tagger targetValue)

You probably will never need this, but hopefully it gives some insights into
how to make custom event handlers.

#### `targetChecked`

``` purescript
targetChecked :: Decoder Bool
```

A `Json.Decoder` for grabbing `event.target.checked`. We use this to define
`onCheck` as follows:

    import Json.Decode as Json

    onCheck : (Bool -> msg) -> Attribute msg
    onCheck tagger =
      on "input" (Json.map tagger targetChecked)

#### `keyCode`

``` purescript
keyCode :: Decoder Int
```

A `Json.Decoder` for grabbing `event.keyCode`. This helps you define
keyboard listeners like this:

    import Json.Decode as Json

    onKeyUp : (Int -> msg) -> Attribute msg
    onKeyUp tagger =
      on "keyup" (Json.map tagger keyCode)

**Note:** It looks like the spec is moving away from `event.keyCode` and
towards `event.key`. Once this is supported in more browsers, we may add
helpers here for `onKeyUp`, `onKeyDown`, `onKeyPress`, etc.


