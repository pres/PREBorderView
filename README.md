PREBorderView
=============

A very simple Objective-C `UIView` category for specifying single-sided borders. 

<p align="center" >
  <img src="https://raw.githubusercontent.com/pres/PREBorderView/master/sample.png" alt="sample" title="sample">
</p>
---

## Installation

###Using CocoaPods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like PREBorderView in your projects.

####Podfile

```ruby
pod 'PREBorderView', "~> 3.0"
```

###Manual

Otherwise just include `UIView+PREBorderView.{h,m}` in your project.

---

## Usage

Adding a line to a view

```objective-c
UIView* view = [[UIView alloc] initWithFrame:frame];
[view addBorderWithColor:[UIColor blackColor] andWidth:2 atPosition:PREBorderPositionRight];
```

Remove a line

```objective-c
[view removeBorderAtPosition:PREBorderPositionRight];
```

For convenience of usage you are able to specify a `defaultBorderColor` as well as 

- `addRetinaPixelBorderWithColor:atPosition:` which adds a line of with a width of one display pixel (retina pixel)
- `addRetinaPixelBorderAtPosition:` adds the line useing the `defaultBorderColor`
- ...

To easily update all borders to size changes of views use 
  - Use `layoutBorders` to update borders of a view.
  - Use `layoutSubviewBorders` to update borders of a view, as well as all borders of subviews.
  
To update a controller's view to auto layout changes call `layoutSubviewBorders` in `viewDidLayoutSubviews`.

###[Full Documentation](http://cocoadocs.org/docsets/PREBorderView)

---

## Communication

- If you **found a bug**, _and can provide steps to reliably reproduce it_, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

---

## License

`PREBorderView` is released under the MIT license. See `LICENSE` for details.
