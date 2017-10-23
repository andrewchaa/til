## Bindings

### Simple bindings

    kernel.Bind<IAppSettings>().To<AppSettingsWrapper>();
    kernel.Bind<IS3Repository>().To<S3Repository>();
    kernel.Bind<IDataPipelineServiceHost>().To<DataPipelineServiceHost>();

### With constructor injection

    kernel.Bind<IPublisher>()
        .To<Publisher>()
        .InSingletonScope()
        .WithConstructorArgument("cultureInfo", CultureInfo.InvariantCulture)
        .WithConstructorArgument("hostName", ConfigurationManager.AppSettings["Host"])
        .WithConstructorArgument("port", int.Parse(ConfigurationManager.AppSettings["Port"]))
        .WithConstructorArgument("prefix", ConfigurationManager.AppSettings["Prefix"]);

### Generic Interface

    kernel.Bind(typeof(IRepository<>)).To(typeof(SimpleRepository<>));
