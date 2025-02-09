# Use the official Rust image
FROM rust:1.82 AS builder

# Set the working directory
WORKDIR /usr/src/app

# Copy the source code
COPY . .

# Build the application
RUN cargo build --release

FROM gcr.io/distroless/cc

# Set the working directory
WORKDIR /app

# Copy the compiled binary
COPY --from=builder /usr/src/app/target/release/chatbot .

# Expose the port
EXPOSE 8080

# Run the application
CMD ["./chatbot"]
