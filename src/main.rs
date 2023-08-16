use poem::{listener::TcpListener, Result, Route};
use poem_openapi::{payload::Json, ApiResponse, Object, OpenApi, OpenApiService};
use serde::{Deserialize, Serialize};
#[derive(Serialize, Deserialize, Debug, Clone, Object)]
pub struct Health {
    status: String,
}

#[derive(ApiResponse)]
enum GetResponse {
    #[oai(status = 200)]
    Health(Json<Health>),
}
struct UnleashApi;

#[OpenApi]
impl UnleashApi {
    #[oai(path = "/internal-backstage/health", method = "get")]
    async fn health(&self) -> Result<GetResponse> {
        Ok(GetResponse::Health(Json(Health {
            status: "OK".into(),
        })))
    }
}
#[tokio::main]
async fn main() -> Result<(), std::io::Error> {
    let unleash =
        OpenApiService::new(UnleashApi, "Unleash For Rust", "1.0").server("http://localhost:5133/");
    let ui = unleash.swagger_ui();
    let spec = unleash.spec();
    let app = Route::new()
        .nest("/", unleash)
        .nest("/ui", ui)
        .at("/spec", poem::endpoint::make_sync(move |_| spec.clone()));
    poem::Server::new(TcpListener::bind("127.0.0.1:5133"))
        .run(app)
        .await
}
