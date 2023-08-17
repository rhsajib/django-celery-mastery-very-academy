import os
from celery import Celery


# Set the default Django settings module for the 'celery' program from manage.py
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'dcelery.settings')


# Create a celery instace
app = Celery('dcelery')              # 'dcelery' refers directory where settings.py is located 


# The configuration object to child processes.
# namespace='CELERY' means all celery-related configuration keys should have a `CELERY_` prefix.
app.config_from_object('django.conf:settings', namespace='CELERY')


# Load task modules from all registered Django apps.
app.autodiscover_tasks()


@app.task(bind=True, ignore_result=True)
def debug_task(self):
    print(f'Request: {self.request!r}')