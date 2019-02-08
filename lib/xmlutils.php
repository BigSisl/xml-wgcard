<?php

/**
 * This loads an xml document DIRECTLY sent over
 * HTTP. E.g. this cannot be used for HTML forms,
 * but only as endpoints to AJAX requests or business API.
 *
 * @return in memory xml document
 */
function load_xml_from_request() { 
    $postData = file_get_contents('php://input');
    return simplexml_load_string($postData);
}
