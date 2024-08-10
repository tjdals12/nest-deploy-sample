import { Controller, Get } from '@nestjs/common';

@Controller('cats')
export class CatsController {
  @Get()
  find() {
    return 'GET /cats';
  }
}
