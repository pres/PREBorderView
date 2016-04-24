#Change Log
All notable changes to this project will be documented in this file.
`PREBorderView` adheres to [Semantic Versioning](http://semver.org/).

--- 

##[3.1.0](https://github.com/pres/PREBorderView/releases/tag/3.1.0) (2016-04-24)

#### Added
* Added functionality to easily update all borders to size changes of views, which improves compatibility with auto layout.
  * Use `layoutBorders` to update borders of a view.
  * Use `layoutSubviewBorders` to update borders of a view, as well as all borders of subviews.

##[3.0](https://github.com/pres/PREBorderView/releases/tag/3.0) (2015-11-23)

#### Added
* You can now specify if a border is dranw inside or outside of the view
  * Current behaviour does not change
  * Extended `PREBorderPosition` to add `*Outside` variants.

#### Updated
* Removed methods deprecated in [2.1](https://github.com/pres/PREBorderView/releases/tag/2.1)
* Switched from `enum` to `NS_ENUM` for `PREBorderPosition`
