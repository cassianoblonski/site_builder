



# Setup do Projeto

**Download do projeto**

```console
git clone https://github.com/cassianoblonski/site_builder.git
cd site_builder
```

**Instale as gems do projeto**:

```console
gem install bundler
bundle install
```

##### Cria o banco de dados e realiza as migrations

```console
bundle exec rails db:create db:migrate
```

**Roda todos os testes **:

```console
bundle exec rspec
```

**Inicie a api em `http://localhost:3000` por padrão**:

```console
bundle exec rails server
```



# Endpoints

## **GET /website_config **

Endpoint retorna status do ultimo website_config enviado:

Exemplo de respota para a requisição:

```json
{
    "job_status": "complete"
}
```



## **POST /website_config **

Endpoint para criar uma Configuração do Website, tem como requisito minimo as chaves abaixo:
    "**site_name**": "Campo do tipo string para definir o nome e titulo do website"
    "**title_color**": "hex para definir a cor do titulo"
    "**background_color**": "hex para definir a cor do fundo do site"
    "**banner_background_color**": "hex para definir a cor de fundo do card de titulo"
    "**icon_url**": "url do icon utilizado no card de titulo e favicon"

Exemplo de parametros para a requisição.

```json
# exemplo de parametros para a request
{
    "site_name": "My Site Builder 4",
    "title_color": "#000",
    "background_color": "#fff000",
    "banner_background_color": "#f00",
    "icon_url": "https://icon-library.com/images/icon-favicon/icon-favicon-4.jpg",
    "calendar_widget_attributes": {
        "title": "Libero eum optio.",
        "day": "2020-08-24",
        "position": 1
    },
    "weather_widget_attributes": {
        "lat": 76,
        "long": -37,
        "position": 2
    },
    "video_widgets_attributes": [
        {
            "url": "https://www.w3schools.com/html/mov_bbb.mp4",
            "title": "Commodi at tenetur.",
            "position": 13
        },
        {
            "url": "https://www.w3schools.com/html/mov_bbb.mp4",
            "title": "Corrupti accusantium tempore.",
            "position": 14
        }
    ],
    "text_widgets_attributes": [
        {
            "title": "Amet sed molestias.",
            "content": "Culpa qui voluptate. Fuga aperiam expedita. In consequatur distinctio.",
            "background_color": "#008000",
            "position": 3
        },
        {
            "title": "Quam autem hic.",
            "content": "Dicta consequatur consectetur. Illo qui fugiat. Possimus aut libero.",
            "background_color": "#008000",
            "position": 4
        },
        {
            "title": "Expedita voluptas enim.",
            "content": "Ea eaque maxime. Quasi quis saepe. Aliquid autem dolores.",
            "background_color": "#008000",
            "position": 5
        },
        {
            "title": "Unde provident commodi.",
            "content": "Quas et nemo. Doloribus impedit quia. Accusantium voluptatum omnis.",
            "background_color": "#008000",
            "position": 6
        },
        {
            "title": "Voluptates sit assumenda.",
            "content": "Accusantium officiis sit. Et voluptatem cumque. Deserunt consectetur laborum.",
            "background_color": "#008000",
            "position": 7
        },
        {
            "title": "Amet sequi quia.",
            "content": "Autem incidunt harum. Voluptas nam rerum. Tempore ut accusamus.",
            "background_color": "#008000",
            "position": 8
        },
        {
            "title": "Qui autem quis.",
            "content": "Eaque temporibus aliquid. Quae illo eos. Ea voluptatum qui.",
            "background_color": "#008000",
            "position": 9
        },
        {
            "title": "Nemo eos provident.",
            "content": "Eius beatae quia. Nisi possimus dolorum. Adipisci aut minima.",
            "background_color": "#008000",
            "position": 10
        },
        {
            "title": "Commodi placeat occaecati.",
            "content": "Debitis dolor quas. Necessitatibus dolores a. Est facilis sit.",
            "background_color": "#008000",
            "position": 11
        },
        {
            "title": "Harum possimus eum.",
            "content": "Vel natus fugit. Voluptatem atque quas. Est et omnis.",
            "background_color": "#008000",
            "position": 12
        }
    ]
}
```

Exemplo de resposta para uma requisição com sucesso.

```json
{

  "website_config_id": 60,

  "job_status": "queued",

  "job_id": "0c16382a-194c-4be6-a38e-3878df2b8e9a"

}
```

## **GET /website_builds**

Endpoint retorna o html da ultima build:

Exemplo de resposta para a requisição:

```html
<!DOCTYPE html>

<html>

<head>
	<title>website_config.site_name</title>

	<link rel="shortcut icon" type="image/x-icon"
		href="https://icon-library.com/images/icon-favicon/icon-favicon-4.jpg" />
</head>

<body>
	<div style="background-color:#fff000">
		<div id="title_banner" style="background-color: #f00;">
			<h1><img alt="Website Icon" src="https://icon-library.com/images/icon-favicon/icon-favicon-4.jpg" width="30" height="30" />My Site Builder 4</h1>
		</div>

		<div id="calendar-widget">
			<h3>Libero eum optio.</h3>
			<div data-day="&quot;2020-08-24&quot;">2020-08-24</div>
		</div>
		<div id="weather-widget" data-latitude="76" data-longitude="-37"></div>
		<div id="text-widget" style="background-color: #008000;">
			<h3>Amet sed molestias.</h3>
			<span>Culpa qui voluptate. Fuga aperiam expedita. In consequatur distinctio.</span>
		</div>
		<div id="text-widget" style="background-color: #008000;">
			<h3>Quam autem hic.</h3><span>Dicta consequatur consectetur. Illo qui fugiat. Possimus aut libero.</span>
		</div>
		<div id="text-widget" style="background-color: #008000;">
			<h3>Expedita voluptas enim.</h3><span>Ea eaque maxime. Quasi quis saepe. Aliquid autem dolores.</span>
		</div>
		<div id="text-widget" style="background-color: #008000;">
			<h3>Unde provident commodi.</h3>
			<span>Quas et nemo. Doloribus impedit quia. Accusantium voluptatum omnis.</span>
		</div>
		<div id="text-widget" style="background-color: #008000;">
			<h3>Voluptates sit assumenda.</h3>
			<span>Accusantium officiis sit. Et voluptatem cumque. Deserunt consectetur laborum.</span>
		</div>
		<div id="text-widget" style="background-color: #008000;">
			<h3>Amet sequi quia.</h3><span>Autem incidunt harum. Voluptas nam rerum. Tempore ut accusamus.</span>
		</div>
		<div id="text-widget" style="background-color: #008000;">
			<h3>Qui autem quis.</h3><span>Eaque temporibus aliquid. Quae illo eos. Ea voluptatum qui.</span>
		</div>
		<div id="text-widget" style="background-color: #008000;">
			<h3>Nemo eos provident.</h3><span>Eius beatae quia. Nisi possimus dolorum. Adipisci aut minima.</span>
		</div>
		<div id="text-widget" style="background-color: #008000;">
			<h3>Commodi placeat occaecati.</h3>
			<span>Debitis dolor quas. Necessitatibus dolores a. Est facilis sit.</span>
		</div>
		<div id="text-widget" style="background-color: #008000;">
			<h3>Harum possimus eum.</h3><span>Vel natus fugit. Voluptatem atque quas. Est et omnis.</span>
		</div>
		<div id="video-widget">
			<h3>Commodi at tenetur.</h3><video controls="controls"
				src="https://www.w3schools.com/html/mov_bbb.mp4"></video>
		</div>
		<div id="video-widget">
			<h3>Corrupti accusantium tempore.</h3><video controls="controls"
				src="https://www.w3schools.com/html/mov_bbb.mp4"></video>
		</div>
	</div>
</body>

</html>
```

