using Newtonsoft.Json;
using System;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Windows.Forms;
using System.Xml.Linq;

namespace WindowsFormsExchange
{
    public partial class MainForm : Form
    {
        private string _fileName = "Exchanges.xml";
        private XDocument _xDocument;
        private double _rate;

        public MainForm()
        {
            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            try
            {
                using (WebClient webClient = new WebClient())
                {
                    webClient.DownloadFile("https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange", _fileName);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

                Close();
            }

            _xDocument = XDocument.Load(_fileName);
            foreach (XElement item in _xDocument.Element("exchange").Elements("currency"))
            {
                cbCurrencies.Items.Add(item.Element("txt").Value);
            }
            cbCurrencies.SelectedIndex = 0;
        }

        private void cbCurrencies_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                XElement element = _xDocument.Element("exchange").Elements("currency").First(el => el.Element("txt").Value == cbCurrencies.SelectedItem.ToString());

                _rate = double.Parse(element.Element("rate").Value.Replace(".", CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator));

                lblCurrency.Text = element.Element("cc").Value;
            }
            catch { }
        }

        private void tbSum_TextChanged(object sender, EventArgs e)
        {
            btnConvert.Enabled = !string.IsNullOrWhiteSpace(tbSum.Text);
        }

        private void btnConvert_Click(object sender, EventArgs e)
        {
            try
            {
                //double sum = double.Parse(tbSum.Text.Replace(".", CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator));

                //lblResult.Text = $"Результат {sum * _rate} грн.";

                OpenWeather openWeather = new OpenWeather();
                lblResult.Text = openWeather.GetWeather();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }

    class JsonInfo
    {
        [JsonProperty("main")]
        public Main Main { get; set; }

        [JsonProperty("visibility")]
        public string Visibility { get; set; }

        // ...
    }

    public class Main
    {
        [JsonProperty("temp")]
        public string Temperature { get; set; }

        [JsonProperty("temp_min")]
        public string TempMin { get; set; }

        [JsonProperty("temp_max")]
        public string TempMax { get; set; }

        // ...
    }
    class OpenWeather
    {
        internal string GetWeather()
        {
            WebClient webClient = null;
            try
            {
                string city = "Kharkiv";
                string key = "ab6b2d11fe27dbf728f94b9650e79608";

                webClient = new WebClient();

                string info = webClient.DownloadString($"http://api.openweathermap.org/data/2.5/weather?q={city}&units=metric&appid={key}");

                JsonInfo jsonInfo = JsonConvert.DeserializeObject<JsonInfo>(info);

                return $"Temperature now: {jsonInfo.Main.Temperature}\nVisibility: {jsonInfo.Visibility}";
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return null;
            }
            finally
            {
                webClient?.Dispose();
            }
        }
    }
}
