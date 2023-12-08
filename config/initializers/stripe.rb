Rails.application.config.stripe = {
    publishable_key: 'pk_test_51OAdwnIXUYgVHzPYdgHXXfBVa8OpQY5Az9qxBQwDblR9eecURYpXYFtiEoWkHqGSG5O8N2ZxJkmqE9XnY90xjTKi003o6lC4nE',
    secret_key: 'sk_test_51OAdwnIXUYgVHzPYpWzdlePo4ZL9cGw4GqyFgzZUypTjvvEWhDLh0KC1oTn79dpwM2EMvXOy12IN7dBQe863nio80014h3eZDL'
}

Stripe.api_key = Rails.application.config.stripe[:secret_key]