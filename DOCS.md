# Home Assistant Add-on: Brother-QL-Web

This is a web service to print labels on Brother QL label printers.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
printer: 192.168.1.98
model: QL-500
default-label-size: 62
default-orientation: standard
```

### Option: `printer`

The `printer` option defines which printer to use. You should define proper IP address like:

- '192.168.1.98'

### Option: `model`

The model of your printer (default: QL-500)
Possible Options are:

- QL-500
- QL-550
- QL-560
- QL-570
- QL-580N
- QL-650TD
- QL-700
- QL-710W
- QL-720NW
- QL-810W
- QL-820NWB
- QL-1050
- QL-1060N

### Option: `default_label_size`

Label size inserted in your printer. Defaults to 62.

|  Name  | Printable px |       Description      |
|--------|--------------|------------------------|
| 12     |      106     |       12mm endless     |
| 29     |      306     |       29mm endless     |
| 38     |      413     |       38mm endless     |
| 50     |      554     |       50mm endless     |
| 54     |      590     |       54mm endless     |
| 62     |      696     |       62mm endless     |
| 102    |      1164    |       102mm endless    |
| 17x54  |   165 x  566 |   17mm x 54mm die-cut  |
| 17x87  |   165 x  956 |   17mm x 87mm die-cut  |
| 23x23  |   202 x  202 |   23mm x 23mm die-cut  |
| 29x42  |   306 x  425 |   29mm x 42mm die-cut  |
| 29x90  |   306 x  991 |   29mm x 90mm die-cut  |
| 39x90  |   413 x  991 |   38mm x 90mm die-cut  |
| 39x48  |   425 x  495 |   39mm x 48mm die-cut  |
| 52x29  |   578 x  271 |   52mm x 29mm die-cut  |
| 62x29  |   696 x  271 |   62mm x 29mm die-cut  |
| 62x100 |   696 x 1109 |  62mm x 100mm die-cut  |
| 102x51 |  1164 x  526 |   102mm x 51mm die-cut |
| 102x152|  1164 x 1660 |  102mm x 153mm die-cut |
| d12    |   94 x   94  |   12mm round die-cut   |
| d24    |  236 x  236  |   24mm round die-cut   |
| d58    |  618 x  618  |   58mm round die-cut   |

### Option: `default_orientation`

Label orientation, defaults to "standard". To turn your text by 90°,
state "rotated".

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

## Usage

> Once it's running, access the web interface by Home Assistant Ingress. _Working On..._

If you define port forward, go to <http://home-assistant.local:PORT>.
You will then be forwarded by default to the interactive web gui located at `/labeldesigner`.

All in all, the web server offers:

* a Web GUI allowing you to print your labels at `/labeldesigner`,
* an API at `/api/print/text?text=Your_Text&font_size=100&font_family=Minion%20Pro%20(%20Semibold%20)`
  to print a label containing 'Your Text' with the specified font properties.

### Custom Fonts

**Note**: _Remember to restart the add-on when you newly added fonts._

You can use custom fonts in `/addon_configs/********_brother-ql-web/fonts`.

It should be .ttf/.otf fonts format.

## License

This software is published under the terms of the GPLv3, see the LICENSE file in the repository.

Parts of this package are redistributed software products from 3rd parties. They are subject to different licenses:

* [Bootstrap](https://github.com/twbs/bootstrap), MIT License
* [Font Awesome](https://github.com/FortAwesome/Font-Awesome), CC BY 4.0 License
* [jQuery](https://github.com/jquery/jquery), MIT License