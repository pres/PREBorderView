# Change Log
All notable changes to this project will be documented in this file.
`PREBorderView` adheres to [Semantic Versioning](http://semver.org/).

--- 

## [3.2.1](#) (not yet released)

#### Updated
* Prefixed `_defaultBorderColor` to `pre_defaultBorderColor` to make name clashes more unlikely.

## [3.2.0](https://github.com/pres/PREBorderView/releases/tag/3.2.0) (2016-12-09)

#### Added
* Added functionality to add a margin to each border, for cases when you don't want the border span the whole width/height of the corresponding view.

## [3.1.1](https://github.com/pres/PREBorderView/releases/tag/3.1.1) (2016-10-21)

#### Fixes
* Fixed an issue with Auto Layout where `layoutSubviewBorders` did not correctly layout all borders.

## [3.1.0](https://github.com/pres/PREBorderView/releases/tag/3.1.0) (2016-04-24)

#### Added
* Added functionality to easily update all borders to size changes of views, which improves compatibility with Auto Layout.
  * Use `layoutBorders` to update borders of a view.
  * Use `layoutSubviewBorders` to update borders of a view, as well as all borders of subviews.

## [3.0.0](https://github.com/pres/PREBorderView/releases/tag/3.0) (2015-11-23)

#### Added
* You can now specify if a border should be drawn inside or outside of the view
  * Current behaviour does not change
  * Extended `PREBorderPosition` to add `*Outside` variants.

#### Updated
* Removed methods deprecated in [2.1](https://github.com/pres/PREBorderView/releases/tag/2.1)
* Switched from `enum` to `NS_ENUM` for `PREBorderPosition`
