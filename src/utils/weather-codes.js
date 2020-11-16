const path = require("path");

export default weatherCodes = {
  rain_heavy: {
    description: "Substantial rain",
    icon: path.resolve(__dirname, "../assets/weather-icons/rain_heavy.svg"),
  },
  rain: {
    description: "Rain",
    icon: path.resolve(__dirname, "../assets/weather-icons/rain.svg"),
  },
  rain_light: {
    description: "Light rain",
    icon: path.resolve(__dirname, "../assets/weather-icons/rain_light.svg"),
  },
  freezing_rain_heavy: {
    description: "Substantial freezing rain",
    icon: path.resolve(
      __dirname,
      "../assets/weather-icons/freezing_rain_heavy.svg"
    ),
  },
  freezing_rain: {
    description: "Freezing rain",
    icon: path.resolve(__dirname, "../assets/weather-icons/freezing_rain.svg"),
  },
  freezing_rain_light: {
    description: "Light freezing rain",
    icon: path.resolve(
      __dirname,
      "../assets/weather-icons/freezing_rain_light.svg"
    ),
  },
  freezing_drizzle: {
    description: "Light freezing rain falling in fine pieces",
    icon: path.resolve(
      __dirname,
      "../assets/weather-icons/freezing_drizzle.svg"
    ),
  },
  drizzle: {
    description: "Light rain falling in very fine drops",
    icon: path.resolve(__dirname, "../assets/weather-icons/drizzle.svg"),
  },
  ice_pellets_heavy: {
    description: "Substantial ice pellets",
    icon: path.resolve(
      __dirname,
      "../assets/weather-icons/ice_pellets_heavy.svg"
    ),
  },
  ice_pellets: {
    description: "Ice pellets",
    icon: path.resolve(__dirname, "../assets/weather-icons/ice_pellets.svg"),
  },
  ice_pellets_light: {
    description: "Light ice pellets",
    icon: path.resolve(
      __dirname,
      "../assets/weather-icons/ice_pellets_light.svg"
    ),
  },
  snow_heavy: {
    description: "Substantial snow",
    icon: path.resolve(__dirname, "../assets/weather-icons/snow_heavy.svg"),
  },
  snow: {
    description: "Snow",
    icon: path.resolve(__dirname, "../assets/weather-icons/snow.svg"),
  },
  snow_light: {
    description: "Light snow",
    icon: path.resolve(__dirname, "../assets/weather-icons/snow_light.svg"),
  },
  flurries: {
    description: "Flurries",
    icon: path.resolve(__dirname, "../assets/weather-icons/flurries.svg"),
  },
  tstorm: {
    description: "Thunderstorm conditions",
    icon: path.resolve(__dirname, "../assets/weather-icons/tstorm.svg"),
  },
  fog_light: {
    description: "Light fog",
    icon: path.resolve(__dirname, "../assets/weather-icons/fog_light.svg"),
  },
  fog: {
    description: "Fog",
    icon: path.resolve(__dirname, "../assets/weather-icons/fog.svg"),
  },
  cloudy: {
    description: "Cloudy",
    icon: path.resolve(__dirname, "../assets/weather-icons/cloudy.svg"),
  },
  mostly_cloudy: {
    description: "Mostly cloudy",
    icon: path.resolve(__dirname, "../assets/weather-icons/mostly_cloudy.svg"),
  },
  partly_cloudy: {
    description: "Partly cloudy",
    icon: {
      day: path.resolve(
        __dirname,
        "../assets/weather-icons/partly_cloudy_day.svg"
      ),
      night: path.resolve(
        __dirname,
        "../assets/weather-icons/partly_cloudy_night.svg"
      ),
    },
  },
  mostly_clear: {
    description: "Mostly clear",
    icon: {
      day: path.resolve(
        __dirname,
        "../assets/weather-icons/mostly_clear_day.svg"
      ),
      night: path.resolve(
        __dirname,
        "../assets/weather-icons/mostly_clear_night.svg"
      ),
    },
  },
  clear: {
    description: "Clear",
    icon: {
      day: path.resolve(__dirname, "../assets/weather-icons/clear_day.svg"),
      night: path.resolve(__dirname, "../assets/weather-icons/clear_night.svg"),
    },
  },
};
