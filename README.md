PREBorderView
=============

A very simple Objective-C `UIView` category for specifying single-sided borders. 

<p align="center" >
  <img src="https://raw.githubusercontent.com/pres/PREBorderView/master/sample.png" alt="sample" title="sample">
</p>

---

## Installation

### Using CocoaPods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like PREBorderView in your projects.

#### Podfile

```ruby
pod 'PREBorderView', "~> 3.2"
```

### Manual

Otherwise just include `UIView+PREBorderView.{h,m}` in your project.

---

## Usage

#### Add a border to a view

```objective-c
[view addBorderWithColor:UIColor.blackColor andWidth:2 atPosition:PREBorderPositionRight];
```

#### Remove a border

```objective-c
[view removeBorderAtPosition:PREBorderPositionRight];
```

#### `defaultBorderColor`

For convenience of usage you are able to specify a `defaultBorderColor`.
- `addBorderWithWidth:atPosition:`
- `addRetinaPixelBorderAtPosition:`

adds the border using `defaultBorderColor`

#### Respond to size changes

To easily update all borders to size changes of views 
  - Use `layoutBorders` to update borders of a view.
  - Use `layoutSubviewBorders` to update borders of a view, as well as all borders of subviews.
  
To update a controller's view to auto layout changes call `layoutSubviewBorders` in `viewDidLayoutSubviews`.

### [Full Documentation](http://cocoadocs.org/docsets/PREBorderView)

---

## Communication

- If you **found a bug**, _and can provide steps to reliably reproduce it_, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

---

## License

`PREBorderView` is released under the MIT license. See `LICENSE` for details.
