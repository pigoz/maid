class LauncherFactory
  def view_controller
    @_nvc ||= MALNavigationController.alloc.init.tap {|nc|
      nc.viewControllers = [launcher_view_controller(nc)]
      nc.eventHandler = ->(symbol) {
        puts items[symbol][:name]
      }
    }
  end

  private
  def launcher_view_controller(handler)
    @_lvc ||= MALLauncher.alloc.initWithItems(items, tapHandler: handler)
  end

  def items
    {
      anime_list: {
        name: "Anime List",
        image: "launcher/anime.png" },
      manga_list: {
        name: "Manga List",
        image: "launcher/manga.png" },
      search: {
        name: "Search",
        image: "launcher/search.png" },
      settings: {
        name: "Settings",
        image: "launcher/settings.png" },
    }
  end

end
