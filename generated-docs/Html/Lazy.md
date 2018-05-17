## Module Html.Lazy

> Since all Elm functions are pure we have a guarantee that the same input
> will always result in the same output. This module gives us tools to be lazy
> about building `Html` that utilize this fact.
>
> Rather than immediately applying functions to their arguments, the `lazy`
> functions just bundle the function and arguments up for later. When diffing
> the old and new virtual DOM, it checks to see if all the arguments are equal.
> If so, it skips calling the function!
>
> This is a really cheap test and often makes things a lot faster, but definitely
> benchmark to be sure!

#### `lazy`

``` purescript
lazy :: forall msg a. Eq a => (a -> Html msg) -> a -> Html msg
```

> A performance optimization that delays the building of virtual DOM nodes.
>
> Calling `(view model)` will definitely build some virtual DOM, perhaps a lot of
> it. Calling `(lazy view model)` delays the call until later. During diffing, we
> can check to see if `model` is referentially equal to the previous value used,
> and if so, we just stop. No need to build up the tree structure and diff it,
> we know if the input to `view` is the same, the output must be the same!

#### `lazy_`

``` purescript
lazy_ :: forall msg a. (a -> Html msg) -> a -> Html msg
```

Like `lazy`, but without the `Eq` constraint.

#### `lazy2`

``` purescript
lazy2 :: forall msg a b. Eq a => Eq b => (a -> b -> Html msg) -> a -> b -> Html msg
```

> Same as `lazy` but checks on two arguments.

#### `lazy2_`

``` purescript
lazy2_ :: forall msg a b. (a -> b -> Html msg) -> a -> b -> Html msg
```

Like `lazy2`, but without the `Eq` constraint.

#### `lazy3`

``` purescript
lazy3 :: forall msg a b c. Eq a => Eq b => Eq c => (a -> b -> c -> Html msg) -> a -> b -> c -> Html msg
```

> Same as `lazy` but checks on three arguments.

#### `lazy3_`

``` purescript
lazy3_ :: forall msg a b c. Eq a => Eq b => Eq c => (a -> b -> c -> Html msg) -> a -> b -> c -> Html msg
```

Like `lazy3`, but without the `Eq` constraint.


