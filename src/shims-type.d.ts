import Vue from 'vue';

declare module 'vue/types/vue' {
  interface Vue {
    $request(key: string, data?: any): Promise<any>;
    $handleException(e: Error, content?: string): void;
  }
}
