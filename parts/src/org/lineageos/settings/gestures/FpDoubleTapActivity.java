/*
 * Copyright (C) 2023 Paranoid Android
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.settings.gestures;

import android.os.Bundle;

import com.android.settingslib.collapsingtoolbar.CollapsingToolbarBaseActivity;
import com.android.settingslib.widget.R;

public class FpDoubleTapActivity extends CollapsingToolbarBaseActivity {

    private static final String TAG = "fp_double_tap";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

<<<<<<< HEAD
        getSupportFragmentManager().beginTransaction().replace(R.id.content_frame,
=======
        getFragmentManager().beginTransaction().replace(R.id.content_frame,
>>>>>>> bd4f092 (marble: Introduce double tap on fingerprint sensor gesture)
                new FpDoubleTapFragment(), TAG).commit();
    }

}
