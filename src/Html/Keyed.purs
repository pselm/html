
-- | > A keyed node helps optimize cases where children are getting added, moved,
-- | > removed, etc. Common examples include:
-- | >
-- | >   - The user can delete items from a list.
-- | >   - The user can create new items in a list.
-- | >   - You can sort a list based on name or date or whatever.
-- | >
-- | > When you use a keyed node, every child is paired with a string identifier. This
-- | > makes it possible for the underlying diffing algorithm to reuse nodes more
-- | > efficiently.

module Elm.Html.Keyed
    ( node
    , ol
    , ul
    )
    where

import Elm.Default

import Data.Foldable (class Foldable)
import Elm.VirtualDom as VirtualDom
import Elm.Html (Attribute, Html)


-- | > Works just like `Html.node`, but you add a unique identifier to each child
-- | > node. You want this when you have a list of nodes that is changing: adding
-- | > nodes, removing nodes, etc. In these cases, the unique identifiers help make
-- | > the DOM modifications more efficient.
node :: ∀ f g msg. Foldable f => Foldable g => String -> f (Attribute msg) -> g ( String /\ Html msg ) -> Html msg
node =
    VirtualDom.keyedNode


ol :: ∀ f g msg. Foldable f => Foldable g => f (Attribute msg) -> g ( String /\ Html msg ) -> Html msg
ol =
    node "ol"


ul :: ∀ f g msg. Foldable f => Foldable g => f (Attribute msg) -> g ( String /\ Html msg ) -> Html msg
ul =
    node "ul"
