using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Xml;

namespace WeatherCSharp
{
    /// <summary>
    /// Logique d'interaction pour MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        const string apiUrl = @"http://api.wunderground.com/api/484cdcd2dd87fcaa/";
        static string lang = "lang:FR";
        static string city = "Montpellier";
        static string fileExtention = ".xml";

        static string remotePathCondition = apiUrl + "conditions/" + lang + "/q/France/" + city + fileExtention;
        static string remotePathForecast = apiUrl + "forecast/" + lang + "/q/France/" + city + fileExtention;
        static string localPathCondition = System.IO.Path.GetTempPath() + city;

        public MainWindow()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Change color Themes on Click with a Toggle
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Toggle_theme_Click(object sender, RoutedEventArgs e)
        {
            if ((sender as ToggleButton).IsChecked ?? false)
            {
                if (Application.Current.Resources.Contains("bluColor"))
                {
                    Application.Current.Resources["bluColor"] = Application.Current.Resources["oraColor"];
                }
            }
            else
            {
                if (Application.Current.Resources.Contains("bluColor"))
                {
                    Application.Current.Resources["bluColor"] = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FF00D7FF"));
                }
            }
        }

        /// <summary>
        /// Methods to refresh some data from API on click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Refresh_Click(object sender, RoutedEventArgs e)
        {

            DateBox.Text = GetDateTitleCase();

            PrintCurrentConditions();

            PrintForecastConditions();
        }

        /// <summary>
        /// Method to set the date with UpperCase in French Culture.Info
        /// </summary>
        /// <returns></returns>
        private string GetDateTitleCase()
        {
            var dt = DateTime.Now;
            Thread.CurrentThread.CurrentCulture = new CultureInfo("fr-FR", true);
            var ci = Thread.CurrentThread.CurrentCulture;

            var monthNames = new[] { "Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre", string.Empty };
            var daysNames = new[] { "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"};

            ci.DateTimeFormat.AbbreviatedMonthNames = monthNames;
            ci.DateTimeFormat.AbbreviatedDayNames = daysNames;
            
            return dt.ToString("ddd dd MMM yyyy");
        }
        
        /// <summary>
        /// Methods define a message on "Close" menu
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Close_Click(object sender, RoutedEventArgs e)
        {
            //--Set a message box to ask user to quit the apps or cancel--//
            MessageBoxResult msg = MessageBox.Show("Do you want to quit ?", "Please Confirm", MessageBoxButton.YesNoCancel);
            if (msg == MessageBoxResult.Yes)
            {
                Application.Current.Shutdown();
            }
        }

        /// <summary>
        /// Methods define a message
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void About_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult msg = MessageBox.Show("Apps Writen in C# by Mikl!", "WeatherApp !");
        }

        /// <summary>
        /// Methods to change localisation to display in App
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void OnMenuLocalItem_Click(object sender, RoutedEventArgs e)
        {
            MenuItem item = e.OriginalSource as MenuItem;

            if (null != item)
            {
                if (Mar.IsChecked == true)
                {
                    city = "Marseille";
                    Mar.IsChecked = false;
                }
                else if (Mtp.IsChecked == true)
                {
                    city = "Montpellier";
                    Mtp.IsChecked = false;
                }
                else if (Par.IsChecked == true)
                {
                    city = "Paris";
                    Par.IsChecked = false;
                }
                else if (Nic.IsChecked == true)
                {
                    city = "Nice";
                    Nic.IsChecked = false;
                }
                else if (Tou.IsChecked == true)
                {
                    city = "Toulouse";
                    Tou.IsChecked = false;
                }
            }

        }

        /// <summary>
        /// Method to change Display Langage in App (FR/EN)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void OnMenuLangage_Click(object sender, RoutedEventArgs e)
        {
            MenuItem item = e.OriginalSource as MenuItem;

            if (null != item)
            {
                if (FR.IsChecked == true)
                {
                    EN.IsChecked = false;
                    lang = "lang:FR";
                    FR.IsChecked = false;
                }
                else if (EN.IsChecked == true)
                {
                    FR.IsChecked = false;
                    lang = "lang:EN";
                    EN.IsChecked = false;
                }
            }

        }

        /// <summary>
        /// Method to print GetCurrentConditions() Weather in Textbox
        /// </summary>
        public void PrintCurrentConditions()
        {
            Condition cond = null;
            cond = GetCurrentConditions();

            //--Assign string from GetCurrentConditions() to show in TextBox--// 

            tempC.Text = cond.TempC + "°C";
            tempMinMax.Text = "min " + cond.TempL + "°C / " + "max " + cond.TempH + "°C";
            windStatus.Text = cond.Wind + " km/h";
            weatherStatus.Text = cond.Weather;
            localisation.Text = cond.City;

            //--Change WeatherIcon when refreshing in app-menu--//
            //--Depends on how the currrent weather status is--//

            if (cond.Icon == "clear")
            {
                PackIconKind icon = PackIconKind.WeatherSunny;
                currentWeatherIcon.Kind = icon;
            }
            else if (cond.Icon == "cloudy")
            {
                PackIconKind icon = PackIconKind.WeatherCloudy;
                currentWeatherIcon.Kind = icon;
            }
            else if (cond.Icon == "mostlycloudy")
            {
                PackIconKind icon = PackIconKind.WeatherCloudy;
                currentWeatherIcon.Kind = icon;
            }
            else if (cond.Icon == "partlycloudy")
            {
                PackIconKind icon = PackIconKind.WeatherCloudy;
                currentWeatherIcon.Kind = icon;
            }
            else if (cond.Icon == "chancerain")
            {
                PackIconKind icon = PackIconKind.WeatherRainy;
                currentWeatherIcon.Kind = icon;
            }
            else if (cond.Icon == "rain")
            {
                PackIconKind icon = PackIconKind.WeatherPouring;
                currentWeatherIcon.Kind = icon;
            }
            else if (cond.Icon == "sunny")
            {
                PackIconKind icon = PackIconKind.WhiteBalanceSunny;
                currentWeatherIcon.Kind = icon;
            }
        }

        /// <summary>
        /// Method to retrieve Current Day Weather Conditions from an XML via Wunderground API and parse it to string
        /// </summary>
        /// <returns></returns>
        public static Condition GetCurrentConditions()
        {
            //--Path for both Online & Offline Weather Info XML--//
            //--After '/conditions/*/q/' possibility to SET Lang Settings--//
            //--DirectoryInfo to get the right Folder where XML is Stored--//
            //--Issues From different PC School/AtHome--//

            string filename = @"Montpellier.xml";
            DirectoryInfo dir = new DirectoryInfo(Directory.GetCurrentDirectory());
            string path = dir.Parent.Parent.Parent.FullName + "\\" + filename;

            //Online Path API
            //string path = apiUrl + "conditions/" + lang + "/q/France/" + city + fileExtention;

            Condition cond = new Condition();
            XmlDocument xm = new XmlDocument();

            //Path for Store Function
            //xm.Load(localPath);
            xm.Load(path);


            //--Selected Weather Info from XML by SelectSingleNode--//

            cond.City = xm.DocumentElement.SelectSingleNode("current_observation/display_location/full").InnerText;
            cond.Weather = xm.DocumentElement.SelectSingleNode("current_observation/weather").InnerText;
            cond.Icon = xm.DocumentElement.SelectSingleNode("current_observation/icon").InnerText;
            cond.TempC = xm.DocumentElement.SelectSingleNode("current_observation/temp_c").InnerText;
            cond.TempL = xm.DocumentElement.SelectSingleNode("current_observation/dewpoint_c").InnerText;
            cond.TempH = xm.DocumentElement.SelectSingleNode("current_observation/heat_index_c").InnerText;
            cond.Wind = xm.DocumentElement.SelectSingleNode("current_observation/wind_kph").InnerText;
            cond.WindDirection = xm.DocumentElement.SelectSingleNode("current_observation/wind_dir").InnerText;

            return cond;
        }

        /// <summary>
        /// Method to change Icon w/different type of GetForecastConditions() from MaterialDesign Framework Pack Icon
        /// </summary>
        /// <param name="c"></param>
        public void IconChangerForecast(List<Condition> c)
        {
            List<PackIcon> WeatherIcon = new List<PackIcon>();
            List<Condition> cond = null;
            cond = GetForecastConditions();

            //--Add WeatherIcon reference in a List to set different icon when weather is getting by the app--// 

            WeatherIcon.Add(weatherIcon0);
            WeatherIcon.Add(weatherIcon1);
            WeatherIcon.Add(weatherIcon2);

            //--Allow different icon with a "for" for the 3 different weatherIcon (3Days)--//

            for (int i = 0; i < 3; i++)
            {
                if (cond[i].Icon == "clear")
                {
                    PackIconKind icon = PackIconKind.WeatherSunny;
                    WeatherIcon[i].Kind = icon;
                }
                else if (cond[i].Icon == "cloudy")
                {
                    PackIconKind icon = PackIconKind.WeatherCloudy;
                    WeatherIcon[i].Kind = icon;
                }
                else if (cond[i].Icon == "mostlycloudy")
                {
                    PackIconKind icon = PackIconKind.WeatherCloudy;
                    WeatherIcon[i].Kind = icon;
                }
                else if (cond[i].Icon == "partlycloudy")
                {
                    PackIconKind icon = PackIconKind.WeatherCloudy;
                    WeatherIcon[i].Kind = icon;
                }
                else if (cond[i].Icon == "chancerain")
                {
                    PackIconKind icon = PackIconKind.WeatherRainy;
                    WeatherIcon[i].Kind = icon;
                }
                else if (cond[i].Icon == "chancetstorms")
                {
                    PackIconKind icon = PackIconKind.WeatherLightning;
                    WeatherIcon[i].Kind = icon;
                }
                else if (cond[i].Icon == "tstorms")
                {
                    PackIconKind icon = PackIconKind.WeatherLightning;
                    WeatherIcon[i].Kind = icon;
                }
                else if (cond[i].Icon == "rain")
                {
                    PackIconKind icon = PackIconKind.WeatherPouring;
                    WeatherIcon[i].Kind = icon;
                }
                else if (cond[i].Icon == "sunny")
                {
                    PackIconKind icon = PackIconKind.WhiteBalanceSunny;
                    WeatherIcon[i].Kind = icon;
                }
            }

        }

        /// <summary>
        /// Method to print GetForecastConditions() in the expander on WPF
        /// </summary>
        public void PrintForecastConditions()
        {
            List<Condition> cond = null;
            cond = GetForecastConditions();

            IconChangerForecast(cond);

            //Create List to store the 3 different block for the 3 different days
            //Both block are separated and Aligned side by side

            List<TextBlock> DayBlock = new List<TextBlock>();
            List<TextBlock> WeatherBlock = new List<TextBlock>();
            List<TextBlock> TitleBlock = new List<TextBlock>();

            DayBlock.Add(Day0);
            DayBlock.Add(Day1);
            DayBlock.Add(Day2);

            WeatherBlock.Add(DayWeather0);
            WeatherBlock.Add(DayWeather1);
            WeatherBlock.Add(DayWeather2);

            TitleBlock.Add(titleDay0);
            TitleBlock.Add(titleDay1);
            TitleBlock.Add(titleDay2);

            //Using a "for" to get the value from XML for each day

            for (int i = 0; i < 3; i++)
            {
                DayBlock[i].Text = "min. " + cond[i].TempL + "°C / max." + cond[i].TempH + "°C";
                WeatherBlock[i].Text = "  " + cond[i].Weather;
                TitleBlock[i].Text = "• " + cond[i].Day + " " + cond[i].Month + " " + cond[i].Year + " •";
            }
        }

        /// <summary>
        /// Method to retrieve Forecast Weather Conditions for 3 Days from an XML via Wunderground API and store them in List
        /// </summary>
        /// <returns></returns>
        public static List<Condition> GetForecastConditions()
        {
            //--Path for both Online & Offline Weather Info XML--//
            //--After '/forecast/*/q/' possibility to SET Lang Settings--//

            string filename = @"Montpellier_forecast.xml";
            DirectoryInfo dir = new DirectoryInfo(Directory.GetCurrentDirectory());
            string path = dir.Parent.Parent.Parent.FullName + "\\" + filename;

            //string path = apiUrl + "forecast/" + lang + "/q/France/" + city + fileExtention;

            XmlDocument xm = new XmlDocument();

            //Path for Store Function
            //xm.Load(localPath);

            xm.Load(path);

            XmlNode node = xm.SelectNodes("response/forecast/simpleforecast/forecastdays")[0];
            XmlNodeList childNodes = node.ChildNodes;

            List<Condition> conditions = new List<Condition>(childNodes.Count);

            //--Loop to get Value from Selected nodes and Affect them to List<Condition> --//
            //--Int I Start from Value "1" because Forecast API send also Current Day Conditions--//

            for (int i = 1; i < childNodes.Count; i++)
            {
                Condition tmpConditions = new Condition();

                //--Select Conditions from Childnode and Affect it to Weather parameters name--//

                tmpConditions.TempH = childNodes[i].SelectSingleNode("high/celsius").InnerText;
                tmpConditions.TempL = childNodes[i].SelectSingleNode("low/celsius").InnerText;

                tmpConditions.WeekDay = childNodes[i].SelectSingleNode("date/weekday_short").InnerText;
                tmpConditions.Day = childNodes[i].SelectSingleNode("date/day").InnerText;
                tmpConditions.Month = childNodes[i].SelectSingleNode("date/monthname").InnerText;
                tmpConditions.Year = childNodes[i].SelectSingleNode("date/year").InnerText;

                tmpConditions.Weather = childNodes[i].SelectSingleNode("conditions").InnerText;
                tmpConditions.Icon = childNodes[i].SelectSingleNode("icon").InnerText;
                tmpConditions.Wind = childNodes[i].SelectSingleNode("avewind/kph").InnerText;
                tmpConditions.WindDirection = childNodes[i].SelectSingleNode("avewind/dir").InnerText;

                //--Add Temp Weather Conditions to the Conditions List--//

                conditions.Add(tmpConditions);
            }

            return conditions;
        }

        /// <summary>
        /// Parameters name for the condition to display on App
        /// </summary>
        public class Condition
        {
            public string Icon { get; set; }
            public string City { get; set; }
            public string Weather { get; set; }
            public string TempC { get; set; }
            public string TempH { get; set; }
            public string TempL { get; set; }
            public string Humidity { get; set; }
            public string Wind { get; set; }
            public string WindDirection { get; set; }
            public string Latitude { get; set; }
            public string Longitude { get; set; }
            public string PeriodAdded { get; set; }
            public string Day { get; set; }
            public string Month { get; set; }
            public string Year { get; set; }
            public string WeekDay { get; set; }
        }


        /// <summary>
        /// Method to Store and Delete a File into Temp Folder and Delete-it after used
        /// </summary>
        private static void StoreConditions()
        {
            string fileName = System.IO.Path.GetFileName(remotePathCondition);
            string localPath = System.IO.Path.GetTempPath() + "\\" + fileName;

            XmlDocument xm = new XmlDocument();
            xm.Load(remotePathCondition);

            xm.Save(localPath);

            //if (File.Exists(localPath))
            //{
            //    File.Delete(localPath);
            //}
        }

        /// <summary>
        /// Method to store Forecast into Temp Folder
        /// </summary>
        private static void StoreForecast()
        {
            string fileName = System.IO.Path.GetFileName(remotePathForecast);
            string localPath = System.IO.Path.GetTempPath() + "\\" + fileName;

            XmlDocument xm = new XmlDocument();
            xm.Load(remotePathCondition);

            xm.Save(localPath);
           
        }

        private void Expander_Collapsed(object sender, RoutedEventArgs e)
        {
            
        }

      
    }
}
