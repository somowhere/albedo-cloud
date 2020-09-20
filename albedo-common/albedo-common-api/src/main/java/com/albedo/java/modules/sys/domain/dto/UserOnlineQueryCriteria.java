/*
 *  Copyright 2019-2020 somewhere
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package com.albedo.java.modules.sys.domain.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author somewhere
 * @date 2020-05-10
 */
@Data
public class UserOnlineQueryCriteria implements Serializable {


	private Integer current = 1;
	private Integer size = 20;
	private String username;
}
