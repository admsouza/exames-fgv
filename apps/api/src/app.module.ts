import { Module } from '@nestjs/common';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'node:path';
import { AppController } from './app.controller';

@Module({
  imports: [
    ServeStaticModule.forRoot({
      rootPath: join(process.cwd(), 'apps', 'web', 'dist'),
      exclude: ['/api*'],
    }),
  ],
  controllers: [AppController],
})
export class AppModule {}
