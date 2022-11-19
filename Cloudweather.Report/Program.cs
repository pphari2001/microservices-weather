using Cloudweather.Report.BuisinessLogic;
using Cloudweather.Report.Config;
using Cloudweather.Report.DataAccess;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddHttpClient();
builder.Services.AddTransient<IWeatherReportAggregator, WeatherReportAggregator>();
builder.Services.AddOptions();
builder.Services.Configure<WeatherDataConfig>(builder.Configuration.GetSection("WeatherDataConfig"));

builder.Services.AddDbContext<WeatherReportDbContext>(
    opts =>
    {
        opts.EnableSensitiveDataLogging();
        opts.EnableDetailedErrors();
        opts.UseNpgsql(builder.Configuration.GetConnectionString("AppDb"));
    }, ServiceLifetime.Transient
);

var app = builder.Build();

app.MapGet(
    "/weather-report/{zip}",
    async (string zip, [FromQuery] int? days, IWeatherReportAggregator weatherAgg) =>
    {
        if(days == null || days < 1 || days > 30)
        {
            return Results.BadRequest("please provide a 'days' query parameter with a value between 1 and 30");
        }

        var report = await weatherAgg.BuildWeeklyWeatherReport(zip, days.Value);
        return Results.Ok(report);
    });

app.Run();
