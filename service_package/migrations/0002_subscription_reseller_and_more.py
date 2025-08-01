# Generated by Django 5.2.1 on 2025-06-04 19:36

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("reseller", "0001_initial"),
        ("service_package", "0001_initial"),
    ]

    operations = [
        migrations.AddField(
            model_name="subscription",
            name="reseller",
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                related_name="subscriptions",
                to="reseller.reseller",
            ),
        ),
        migrations.AddField(
            model_name="subscription",
            name="subscription_source",
            field=models.CharField(
                choices=[
                    ("direct", "Direct Subscription"),
                    ("reseller", "Via Reseller"),
                ],
                default="direct",
                max_length=20,
            ),
        ),
    ]
