# Generated by Django 5.0.1 on 2024-02-20 08:59

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0008_alter_news_options_news_title_content'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='product',
            name='meta_description',
        ),
        migrations.RemoveField(
            model_name='product',
            name='meta_keywords',
        ),
        migrations.RemoveField(
            model_name='product',
            name='meta_title',
        ),
        migrations.RemoveField(
            model_name='product',
            name='tag',
        ),
    ]