import type {Handle} from "@sveltejs/kit";

export const handle: Handle = async ({ event, resolve })=> {
  const authorization = event.request.headers.get('Authorization');
  const basicAuth = process.env.BASIC_AUTH ?? '';

  if (!authorization || !authorization.startsWith(`Basic ${btoa(basicAuth)}`)) {
    return new Response('Not Authorized', {
      status: 401,
      headers: {
        "WWW-Authenticate": 'Basic realm="Protected", charset="UTF-8"'
      }
    });
  }

  return resolve(event);
}
