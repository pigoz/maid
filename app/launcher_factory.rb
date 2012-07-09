class MALLauncherButton < NILauncherButton
  def init
    super.tap do |instance|
      instance.setTitleColor(UIColor.whiteColor, forState: UIControlStateNormal)
    end
  end
end

class MALLauncher < NILauncherViewController
  def initWithItems(items)
    init.tap do |ml|
      ml.pages = [items]
      ml.title = 'iMAL'
    end
  end

  def launcherButtonClass
    MALLauncherButton
  end

  def buttonDimensionsInLauncherView(launcherView)
    # usual dimensions are 57 iphone, 74 ipad (retina 2x)
    CGSize.new(icon_edge_size + icon_width_padding,
               icon_edge_size + icon_height_padding)
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

class LauncherFactory
  class << self

    def view_controller
      @_nc ||= UINavigationController.alloc \
          .initWithRootViewController(launcher_view_controller).tap {|nc|
        nc.navigationBar.setTintColor(mal_blue)
      }
    end

    private
    def mal_blue
      UIColor.colorWithRed(normalize_rgb(29),
                           green: normalize_rgb(67),
                           blue:  normalize_rgb(155),
                           alpha: 1.0)
    end

    def normalize_rgb(color)
      color / 255.0
    end

    def launcher_view_controller
      @_vc ||= MALLauncher.alloc.initWithItems(make_items)
    end

    def make_items
      @_itms ||= items_repr.map {|item|
        NILauncherItemDetails.itemDetailsWithTitle(
          item[:name],
          imagePath: NIPathForBundleResource(NSBundle.mainBundle,
                                             item[:image]))
      }
    end

    def items_repr
      [
        { name: "Anime List", image: "launcher/anime.png" },
        { name: "Manga List", image: "launcher/manga.png" },
        { name: "Search",     image: "launcher/search.png" },
        { name: "Settigns",   image: "launcher/settings.png" },
      ]
    end

  end
end
