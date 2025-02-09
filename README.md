# chatbot

- Build image

```
docker build -t chatbot .
```

- Run locally

```
docker run -p 8080:8080 chatbot
```

- Loging to GCP

```
gcloud auth login
gcloud config set project volmyr-test
```

- Enable Artifact Registry in Your Google Cloud Project

```
gcloud services enable artifactregistry.googleapis.com
```

- Create an Artifact Registry Repository

```
gcloud artifacts repositories create chatbot-repo \
    --repository-format=docker \
    --location=europe-southwest1
```

- Authenticate Docker with Artifact Registry

```
gcloud auth configure-docker europe-southwest1-docker.pkg.dev
```

- Tag and Push the Image to Artifact Registry

```
docker tag chatbot europe-southwest1-docker.pkg.dev/volmyr-test/chatbot-repo/chatbot
docker push europe-southwest1-docker.pkg.dev/volmyr-test/chatbot-repo/chatbot
```

- Deploy to Cloud Run from Artifact Registry

```
gcloud run deploy chatbot \
  --image europe-southwest1-docker.pkg.dev/volmyr-test/chatbot-repo/chatbot \
  --platform managed \
  --region europe-southwest1 \
  --allow-unauthenticated
```

- List services

```
gcloud run services list
```

- Remove service

```
gcloud run services delete rust-web-server --region europe-southwest1
```
