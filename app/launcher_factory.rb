class LauncherFactory
  class << self
    def launcher_view_controller
      @_vc ||= NILauncherViewController.alloc.init.tap {|vc|
        vc.pages = [make_items]
      }
    end

    def make_items
      @_itms ||= items_repr.map {|item|
        NILauncherItemDetails.itemDetailsWithTitle(item[:name],
                                                   imagePath: item[:image])
      }
    end

    def items_repr
      [
        { name: "My List",  image: "" },
        { name: "Top",      image: "" },
        { name: "Upcoming", image: "" },
      ]
    end
  end
end
