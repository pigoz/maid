class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @launcherFactory = LauncherFactory.new

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.backgroundColor = UIColor.whiteColor
    @window.rootViewController = @launcherFactory.view_controller
    @window.makeKeyAndVisible
    true
  end
end
