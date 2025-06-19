from django.http import JsonResponse

def health_check(request):
    """
    Health check endpoint for AWS App Runner
    """
    return JsonResponse({"status": "healthy"})
