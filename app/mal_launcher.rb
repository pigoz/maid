class MALLauncherButton < NILauncherButton
  def init
    super.tap do |instance|
      instance.setTitleColor(UIColor.whiteColor,
                   forState: UIControlStateNormal)
    end
  end
end

class MALLauncher < NILauncherViewController
  attr_accessor :eventHandler

  def items=(items)
    self.pages = [items.map {|key, item|
      NILauncherItemDetails.itemDetailsWithTitle(
        item[:name],
        imagePath: NIPathForBundleResource(NSBundle.mainBundle, item[:image]))
    }]
    @items = items
  end

  def item_identifier_at_index(index)
    @items.keys[index]
  end

  def initWithItems(items, eventHandler: eventHandler)
    init.tap do |ml|
      ml.eventHandler = eventHandler
      ml.items = items
      ml.title = 'iMAL'
      ml.scrollview.setBackgroundColor(RGBA.darkBlue.uiColor)
    end
  end

  def launcherButtonClass
    MALLauncherButton
  end

  def scrollview
    view.subviews[0]
  end

  def buttonDimensionsInLauncherView(launcherView)
    CGSize.new(icon_edge_size + icon_width_padding,
               icon_edge_size + icon_height_padding)
  end

  def launcherView(launcher, didSelectButton: button,
                   onPage: page, atIndex: index)
    eventHandler.handleEvent(item_identifier_at_index(index))
  end

  private
  def icon_edge_size
    80
  end

  def icon_height_padding
    25
  end

  def icon_width_padding
    10
  end
end
